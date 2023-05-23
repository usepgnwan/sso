<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Contracts\Auth\Guard;
use Illuminate\Http\Request;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\URL;

class MenuMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    protected $auth;
    public function __construct(Guard $auth)
    {
        $this->auth = $auth;
    }

    public function handle(Request $request, Closure $next,$tes=null)
    { 
        $data = ! empty(auth()->user()) ?  $this->__admin_menu() : 0; 
        $global_menu = [
            'admin_menu' => $data, 
        ]; 
        // dump($data);
        view()->share(['global_menu' => $global_menu]); 
        return $next($request);
    }

    function __admin_menu($parent_id = 0,$first=true, $root=0){
        $LEVELID = !empty(auth()->user()) ? auth()->user()->role->id : 0;
        $rows = \DB::table('table_usermenu as um')
        ->select('um.*','am.is_access','am.is_create','am.is_delete', 'am.is_edit','am.is_approve', 'am.is_reject')
        ->join('table_access_menu as am', function($join) use ($LEVELID){
            $join->on('um.id', '=' , 'am.table_usermenu_id');
            $join->where('am.role_id', '=' , $LEVELID);
            $join->where('am.is_access', '=' , 1);
        })
        ->where('um.parent_id',$parent_id)
        ->where('um.status',1)
        ->whereIn('um.type',['menu','devider'])
        ->orderBy('um.weight','asc')
        ->get();   
        $html = '';
        if(count($rows)>0){
            foreach($rows as $k => $v){
                $v = collect($v)->toArray(); 
                $children = \DB::table('table_usermenu')->where('parent_id','=',$v['id'])->count();
                $v['children'] = $children; 
                $html .= $this->__render_menus($v,$first,$children,$k);
            }
        }
        return $html;
    }

    function __render_menus($v,$first=true, $children,$k){ 
        $html = '';
        if($v['type'] == 'devider'){ 
            if($k > 0){
                $html .=  '<hr class="sidebar-divider" />';
            }
            $html .= '<div class="sidebar-heading">'. $v['menu'] .'</div>';
            if($v['children'] > 0 ){
                $html .= $this->__admin_menu($v['id'],$first,$v['children']);
            }
             
        }else if($v['type'] == 'menu'){
            $url = url($v['url']);
            if($v['children'] > 0){  
                if($first == true){
                    $html .= '<li class="nav-item ">'; 
                }
                $id = preg_replace('/\s+/', '-', $v['menu']);
                $parent_colapse =  'class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapse-'. $id .'"
                // aria-expanded="true" aria-controls="collapse-'. $id .'"' ;
                $html .= '<div class="accordion" id="accordion-'.$id.'">'; 
                $html .= '<a '. $parent_colapse .' > <i class="fas fa-fw fa-tachometer-alt"></i> <span>' . $v['menu'] . '</span></a>'; 
                $html .= ' <div id="collapse-'. $id.'" class="collapse" aria-labelledby="headingBootstrap" data-parent="#accordion-'.$id.'">
                            <div class="  py-2 collapse-inner rounded">'; 
                            // dump($v['id']);
                $html .= $this->__admin_menu($v['id'],false);
                $html .= '</div></div>';
                $html .= '</div>';
                if($first == true){
                    $html .=  '</li>';
                }
            }else{
                if($first == true){
                    $html .= '<li class="nav-item ">';
                } 
                $html .= '<a class="nav-link spa-link" href="'. $url .'"> <i class="fas fa-fw fa-tachometer-alt"></i></span>'. $v['menu'] .'</span></a>'; 
                if($first == true){
                    $html .=  '</li>';
                }
               
            }
        }
      
       return $html;

    }



    function admin_menu(){
        $LEVELID = !empty(auth()->user()) ? auth()->user()->role->id : 0;
        $sql = "SELECT u.id,u.menu,u.parent_id,u.type,u.icon,u.url  
                    FROM table_usermenu u
                    LEFT JOIN table_access_menu a ON a.table_usermenu_id = u.id
                WHERE a.is_access = 1 AND u.status = 1 AND u.type IN ('menu','devider') AND a.role_id = '$LEVELID'
                ORDER BY u.parent_id ASC,u.weight ASC,u.id ASC"; 
                $rows = collect(DB::select($sql))->toArray();
               
        $out =  $this->__doThread($rows,0,true);
        return $this->__RenderMenu($out,null,'');
    }
    function __doThread($data, $root,$DisplayRoot=false){
        $out = array();
        $sizeOf = sizeof($data);
		
        for ($ii = 0; $ii < $sizeOf; $ii++) {
            $datax = collect($data[$ii])->toArray();
           
			if($DisplayRoot){
				if($datax['id'] == $root){
					$tmp = $datax;
					$tmp['children'] = null;
					$out[] = $tmp;
				}
			}
            if (($datax['parent_id'] == $root) || (($root === null) && ($datax['parent_id'] == '0'))) {
                $tmp = $datax;
				
                if (isset($datax['id'])) {
                    $tmp['children'] = $this->__doThread($data, $datax['id']);
                } else {
                    $tmp['children'] = null;
                }
				
                $out[] = $tmp;
            }
        }
		 
        return $out;
    }

    function __RenderMenu($rows, $parent = null,$children = null,$html=''){ 
        foreach($rows as $k=>$v){ 
            if(count($v['children']) > 0) {
                if($v['type'] == 'devider'){ 
                    if($k > 0 ){   
                    $html .=  '<hr class="sidebar-divider" />';
                    }
                    $html .= '<div class="sidebar-heading">'. $v['menu'] .'</div>';
                    $html .= $children == '' ? $this->__RenderMenu($v['children'], $v['menu'],count($v['children'])) :  $this->__RenderMenu($v['children'],null,count($v['children']));
                }elseif ($v['type'] == 'menu'){  
                    if($parent != null && $children>0){ 
                        $url = $v['url'];
                        $id = preg_replace('/\s+/', '-', $v['menu']);
                        $parent_colapse = $parent != null ? 'class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapse-'. $id .'"
                        aria-expanded="true" aria-controls="collapse-'. $id .'"' : 'class="nav-link collapsed" href="'. $url .'"';
                        $html .= '<li class="nav-item ">';
                        $html .= '<a '. $parent_colapse .' > <i class="fas fa-fw fa-tachometer-alt"></i> <span> ' . $v['menu'] . '</span></a>';
                        $html .= ' <div id="collapse-'. $id .'" class="collapse" aria-labelledby="headingBootstrap" data-parent="#accordionSidebar"><div class="bg-white py-2 collapse-inner rounded">';
                        // $html .= $parent != null ? '<h6 class="collapse-header">'.$v['menu'].'</h6>' : '';
                        $html .= count($v['children']) > 0 ?  $this->__RenderMenu($v['children'],null,count($v['children'])) : $this->__RenderMenu($v['children'],null,0) ;
                        $html .= '</div></div>';
                        $html .=  '</li>';
                    }else{
                        if(count($v['children']) > 0 ){ 
                            $url = $v['url'];
                            $id = preg_replace('/\s+/', '-', $v['menu']);
                            $parent_colapse = $parent == null ? 'class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapse-'. $id .'"
                            aria-expanded="true" aria-controls="collapse-'. $id .'"' : 'class="nav-link collapsed" href="'. $url .'"';
                            $html .= '<div class="accordion" id="accordion-'.$id.'">'; 
                            $html .= '<a '. $parent_colapse .' > <i class="fas fa-fw fa-tachometer-alt"></i> <span>' . $v['menu'] . '</span></a>'; 
                            $html .= ' <div id="collapse-'. $id.'" class="collapse" aria-labelledby="headingBootstrap" data-parent="#accordion-'.$id.'"><div class="  py-2 collapse-inner rounded">';
                            $html .=  $this->__RenderMenu($v['children'],null,0) ;
                            $html .= '</div></div>';
                            $html .= '</div>';
                       } 
                    }
                }
            }else{  
                $url = $v['url'];
                if($v['type'] == 'devider'){
                    $html .= '<hr class="sidebar-divider" />';
                    $html .= '<div class="sidebar-heading">'. $v['menu'] .'</div>';
                }elseif ($v['type'] == 'menu'){
                    if($parent != null || $v['parent_id'] == 0 ||$v['parent_id'] == null ){
                        $html .= '<li class="nav-item  ">';
                        $html .= '<a class="nav-link" href="'. $url .'"> <i class="fas fa-fw fa-tachometer-alt"></i></span>'. $v['menu'] .'</span></a>';   
                        $html .= '</li>';
                    }else{
                        $html .= '<a class="collapse-item" href="'. $url .'">'. $v['menu'] .'</a>';   

                    }
                }  
            }
        }
        return ($html);
    }
}
