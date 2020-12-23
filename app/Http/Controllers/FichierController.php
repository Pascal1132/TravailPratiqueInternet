<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class FichierController extends Controller
{
    public function dropzone(Request $request){
        $image = $request->file('file');

        $imageName = time().'.'.$image->extension();

        $image->move(storage_path ('app/cheques'),$imageName);

        return response()->json(['success'=>$imageName]);
    }
}
