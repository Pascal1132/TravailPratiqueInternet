<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RefTypeTransaction extends Model
{
    public $table="ref_types_transaction";
    public static function getIdFromType($type){
        return RefTypeTransaction::select(['id'])->where('type', $type)->first();
    }
}
