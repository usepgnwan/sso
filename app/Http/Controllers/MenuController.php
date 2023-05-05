<?php

namespace App\Http\Controllers;

use App\Models\Role;
use App\Models\TableAcessUserMenu;
use App\Models\TableUserMenu;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\DB;

class MenuController extends Controller
{
    protected $usermenu;
    protected $accessmenu;
    public function __construct(TableUserMenu $usermenu,TableAcessUserMenu $accessmenu){
        $this->usermenu = $usermenu;
        $this->accessmenu = $accessmenu;
    }
    public function index(Request $request){
        
         $list_menu = $this->__menu($request);
         $levelaccess = Role::all();
         return view('layouts.menu', compact('list_menu','levelaccess'));
    }

    public function list_menu(Request $request,$id){   
        // $list_menu = $this->__menu($request);
        // return  $list_menu;
        // $menu =  DB::table('table_usermenu')->get();
        if($request->ajax()){
            return $this->__menus($request->id);
        } 
    }

    /**
     * ADMIN MENU
     * 
     */
    function __menus($LEVELID){
        // $LEVELID = !empty(auth()->user()) ? auth()->user()->role->id : 0;
        $functions = DB::table('table_usermenu')->orderBy('weight','asc')->get();
        // dump($functions);
					foreach($functions as $kp=>$vp){
                        $vp = collect($vp);
                        // dump($LEVELID);
						$access =  DB::table('table_access_menu')->select('is_access','is_create','is_edit','is_delete')->where('table_usermenu_id',$vp['id'])->where('role_id',$LEVELID)->first();
                        $access = collect($access);
                        // dump($access);
                        // $this->db->query("SELECT is_access,is_create,is_edit,is_delete FROM table_access_menu where tbl_usermenu_id='".$vp["id"]."' AND tbl_leveluser_id='$LevelID'")->row_array();
 
						if( count($access) > 0 ){
							$vp["is_access"] 	= $access["is_access"];
							$vp["is_create"] 	= $access["is_create"];
							$vp["is_edit"] 		= $access["is_edit"];
							$vp["is_delete"] 	= $access["is_delete"];
						}else{
							$vp["is_access"] 	= 0;
							$vp["is_create"] 	= 0;
							$vp["is_edit"] 		= 0;
							$vp["is_delete"] 	= 0;
						}
						$functions[$kp] = $vp;
						$functions[$kp]['role_id'] = $LEVELID; 
					} 
        $temp = $this->__doThread($functions,0,true);  
        $html = '<ol class="dd-list">';
        $html .= $this->__generateChild($temp);
        $html .= '</ol>'; 
        return $html;
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

	private function __generateChild( &$menus, &$list_menus="",$level=0 , $child = 0) { 
       
            if(  $level > 0  && $child > 0){
                $list_menus .= '<ol class="dd-list">';  
            }
        foreach ( $menus as $row ) { 
			$isHasChild = $this->__hasChild( $row['children'] ); 
            $html = '<li class="dd-item dd3-item" data-role_id="' . $row['role_id'] . '" data-id="' . $row['id'] . '" data-label="' . $row['menu'] . '" data-url="' . $row['url'] . '" data-is_access="' . $row['is_access'] . '" data-is_create="' . $row['is_create'] . '" data-is_edit="' . $row['is_edit'] . '" data-is_delete="' . $row['is_delete'] . '">';
            if ( $isHasChild ) {
                $html .= '<button class="dd-collapse" data-action="collapse" type="button">Collapse</button><button class="dd-expand" data-action="expand" type="button">Expand</button>';
            } 
            $html .= '<div class="dd3-content dd-handle dd3-handle">';
            $isaccess = $row['is_access'] == 1? 'checked="checked"' : '';  
            $is_create = $row['is_create'] == 1? 'checked="checked"' : ''; 
            $is_edit = $row['is_edit'] == 1? 'checked="checked"' : ''; 
            $is_delete = $row['is_delete'] == 1? 'checked="checked"' : ''; 
            $html .= '<div class="row d-flex justify-content-around">
                            <div class="dd-nodrag pt-1 pl-1"> 
                                <label class="customcheck" style="display: block !important;">
                                    <input class="is_access" type="checkbox" '. $isaccess .'>
                                    <span class="checkmark"></span>
                                </label>
                            </div> 
                            <div class="col-8">'. $row['menu'] . '</div>
                            <div class=" ml-auto dd-nodrag pt-1" style="margin-right: 15px;">';
            if($row['type'] == 'menu'){ 
                $html .='<label class="customcheck">
                            <input class="is_create" type="checkbox" '.$is_create.'>
                            <span class="checkmark"></span>
                            <sub>create</sub>
                        </label>
                        <label class="customcheck">
                            <input class="is_edit" type="checkbox" '.$is_edit.'>
                            <span class="checkmark"></span>
                            <sub>update</sub>
                        </label>
                        <label class="customcheck">
                            <input class="is_delete" type="checkbox" '. $is_delete .'>
                            <span class="checkmark"></span>
                            <sub>delete</sub>
                        </label> ';
            }
            $html .= '<a href="#" class="item-access pl-2">
                                    <i class="fa fa-edit"></i>
                                </a>
                                <a href="#" class="item-access pl-2">
                                    <i class="fa fa-trash"></i>
                                </a>
                        </div>
                    </div>';
            $html .= '</div> ';
            $list_menus .= $html;
            if ( $isHasChild ) { 
                $this->__generateChild( $row['children'], $list_menus,$level+1,count($row['children']));               
            } else { 
                    
            }
            
        }

            if( $level > 0 && $child > 0) { 
                $list_menus .= '</ol>'; 
            } 
        
        // $list_menus .= "</ul>";
		return  $list_menus;
    }
	private function __hasChild( $child ) {
        if ( $child && count($child) > 0 ) {
            return true;
        }
        return false;
    }
    // MENU 
    public function __menu($request,$parent_id=0){
        // dump($request);
        // $LEVELID = !empty(auth()->user()) ? auth()->user()->role->id : $request->id;
        $LEVELID =  $request->id;
                // $sql = "SELECT u.id,u.menu,u.parent_id,u.type,u.icon,u.url  
                //             FROM table_usermenu u
                //             LEFT JOIN table_access_menu a ON a.table_usermenu_id = u.id
                //         WHERE  u.status = 1 AND u.type IN ('menu','devider') AND a.role_id = '$LEVELID' and u.parent_id = '$parent_id'
                //         ORDER BY u.parent_id ASC,u.weight ASC,u.id ASC"; 
        // $id = $request->id;
        $rows = DB::table('table_usermenu')
        ->leftJoin('table_access_menu', function($join) use ($LEVELID){
            $join->on('table_usermenu.id', '=' , 'table_access_menu.table_usermenu_id');
            $join->where('role_id', '=' , $LEVELID);
        })
        ->where('parent_id',$parent_id)
        ->where('status',1)
        ->whereIn('type',['menu','devider'])
        ->get();
        $items = '';
        $rows = collect($rows)->toArray(); 
        if(count($rows) > 0){ 
            $items .= '<ol class="dd-list">';
            foreach ($rows as $row) {
                $row = collect($row)->toArray(); 
                $items .= $this->__renderMenuItem($row);
                $items .= $this->__menu($request,$row['id']);
                
            }
            $items .= '</ol>';
        }
        return $items;
    }
    function __renderMenuItem($row)
    { 
        // dump($row);
        $html = '';
        $isaccess = $row['is_access'] == 1? 'checked="checked"' : ''; 
        $html .= '<div class="row d-flex justify-content-around">
                        <div class="dd-nodrag pt-1 pl-1"> 
                            <label class="customcheck" style="display: block !important;">
                                <input class="isaccess" type="checkbox" '. $isaccess .'>
                                <span class="checkmark"></span>
                            </label>
                        </div> 
                        <div class="col-8">'. $row['menu'] .'</div>
                        <div class=" ml-auto dd-nodrag pt-1" style="margin-right: 15px;">';
        if($row['type'] == 'menu'){ 
            $html .='<label class="customcheck">
                        <input class="iscreate" type="checkbox" checked="checked">
                        <span class="checkmark"></span>
                        <sub>create</sub>
                    </label>
                    <label class="customcheck">
                        <input class="isupdate" type="checkbox" checked="checked">
                        <span class="checkmark"></span>
                        <sub>update</sub>
                    </label>
                    <label class="customcheck">
                        <input class="isdelete" type="checkbox" checked="checked">
                        <span class="checkmark"></span>
                        <sub>delete</sub>
                    </label> ';
        }
        $html .= '<a href="#" class="item-access pl-2">
                                <i class="fa fa-edit"></i>
                            </a>
                            <a href="#" class="item-access pl-2">
                                <i class="fa fa-trash"></i>
                            </a>
                    </div>
                </div>';
  
        return '<li class="dd-item dd3-item" data-id="' . $row['id'] . '" data-label="' . $row['menu'] . '" data-url="' . $row['url'] . '" data-isaccess="" data-iscreate="" data-isupdate="" data-isdelete="">' . 
            '<div class="dd3-content dd-handle dd3-handle"> 
            '.  $html. 
            '</div> ';
            
    
    }

    public function save(Request $request){
        $val = json_decode($request->output,true);
        $stat = $this->save_menu($val);
        $response = ['status'=>false,'msg'=>'Failed save changes!'];
        $res_code = Response::HTTP_BAD_REQUEST;
        if($stat){
            $response = ['status'=>$stat,'msg'=>'Success save changes!'];
            $res_code = Response::HTTP_OK;
        }
        return response()->json($response,$res_code);
    }

    public function save_menu($menu,$parent = 0,$stat = false){ 
//    dd($menu);
            if (!empty($menu)) {  
                foreach ($menu as $value) {  
                    $check = $this->usermenu->find($value['id']); 
                    if ($check) {
                        $check->parent_id = $parent; 
                        $stat = $check->save();
                                $this->accessmenu->updateOrCreate(
                                    [
                                        'table_usermenu_id' => $value['id'],
                                        'role_id'=>$value['role_id']
                                    ],
                                    [
                                        "table_usermenu_id"=>$value['id'],
                                        "role_id"=>$value['role_id'],
                                        "is_access"=>$value['is_access'],
                                        "is_create"=>$value['is_create'],
                                        "is_delete"=>$value['is_delete'],
                                        "is_edit"=> $value['is_edit'] 
                                    ]
                                );  
                     }  
                    if (array_key_exists('children', $value))
                        $this->save_menu($value['children'],$value['id'],$stat);
                }

            }
         return $stat;
    }
}
