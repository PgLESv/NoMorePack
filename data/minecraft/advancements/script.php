<?php

define('ROOT_DIR',realpath(__DIR__.'/../../'));
$pastaAtual = 'stats'; // INFORMAR NOME DA PASTA QUE SOFRERÁ A VARREDURA
$pastaOrigins = __DIR__.'/'.$pastaAtual;

printf($pastaOrigins.PHP_EOL);
printf('>>> Root Dir: '.ROOT_DIR.PHP_EOL);

$listaArquivos = scandir($pastaOrigins);
//printf($listaArquivos.PHP_EOL);

$pastaFunctions = getPastasFunctions();

foreach($listaArquivos as $arquivo){

    if ($arquivo == '.' || $arquivo == '..'){
        continue;
    }

    printf('=========================================='.PHP_EOL);
    printf('>>> Arquivo: '.$arquivo.PHP_EOL);
    
    $jsonstring = file_get_contents($pastaOrigins.'/'.$arquivo);
    if ($jsonstring === false) {
        printf( 'Erro na leitura do arquivo: ' . $jsoninputfile . PHP_EOL);
    }

    $jsonstring  = trim($jsonstring , "\xef\xbb\xbf"); // remove utf boom
    $arquivoJson = json_decode($jsonstring, true);

    if(!array_key_exists('rewards', $arquivoJson)){
        continue;
    }

    // Nome da função
    $nomeFuncao = str_replace(':', '/', $arquivoJson['rewards']['function']);
    $nomeFuncao = str_replace('bc_rewards', 'bc_rewards/functions',$nomeFuncao);
    printf('>>> Nome da função: '. $nomeFuncao.PHP_EOL);

    // Caminho do arquivo
    $caminhoFuncao = '/'.$nomeFuncao.'.mcfunction';
    printf('>>> Caminho da função: '.$caminhoFuncao.PHP_EOL);

    // Conteúdo do arquivo
    $content = file_get_contents(ROOT_DIR.$caminhoFuncao);
    printf('>>> Função: '.$content.PHP_EOL);

    foreach($pastaFunctions as $nomeFunction){
        if (str_contains($content,"minecraft:$nomeFunction")){
            $contentNovo = str_replace("minecraft:$nomeFunction","minecraft:$pastaAtual",$content);
        }

        if (str_contains($content,"blazeandcave:$nomeFunction")){
            $contentNovo = str_replace("blazeandcave:$nomeFunction","minecraft:$pastaAtual",$content);
        }
    }

    file_put_contents(ROOT_DIR.$caminhoFuncao, $contentNovo);
    printf('>>>> FOI UM'.PHP_EOL);
    printf('=========================================='.PHP_EOL);
}

printf('>>>> RODOU TUDO'.PHP_EOL);

function getPastasFunctions(){
    $pastasFunctionsOriginal = scandir(ROOT_DIR.'/bc_rewards/functions');

    $pastasFunctions = [];

    foreach($pastasFunctionsOriginal as $pasta){
    
        if(str_contains($pasta,'.')){
            continue;
        }
    
        printf('>>> Pasta: '.$pasta.PHP_EOL);

        array_push($pastasFunctions,$pasta);
    }

    array_push($pastasFunctions,'story');

    return $pastasFunctions;
}

function str_contains($haystack, $needle) {
    return $needle !== '' && mb_strpos($haystack, $needle) !== false;
}