use Data::Shark;

use LsL;
use LsL::DB;

use strict;

$LsL::DB_HOST    = "mysql.server.com";

Data::Shark::DIO::init_dbi({'dbi_func' => 'LsL::DB::sdbi()','file_name' => 'LsL/DIO.pm', 'name_space' => 'LsL'});
