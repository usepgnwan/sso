<?php

use Illuminate\Http\Request;

class GlobalFunc{
    /**
     * CHECK ROUTE PATH ACCES WITHOUT AJAX
     */
    public function check_url($request){
        $rows = \DB::table('table_usermenu as um')->get();
        $rows = collect($rows);
        $url = [];
        foreach($rows as $k => $v){
            $v = collect($v);
            $rep = str_replace('#','',$v['url']);
            $url[$rep] = $v['url'];
        } 
        if(isset($url[$request->path()])  && !$request->ajax()){
            // redirect()->to($url[$request->path()]);
            return redirect($url[$request->path()]);
        }
    }
}