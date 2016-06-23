<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-language" content="ja">
    <meta charset="UTF-8">
</head>
<body>
<h3>ファイル作成と書き込み読み込み</h3>
<?php

$today = new DateTime();
$todayTimestamp = $today->getTimestamp();
$todayString = date("Y-m-d",$todayTimestamp);
echo '今日は '.$todayString.' です。<br/>';



$opts = array(
  'http' => array(
    'method' => "GET",
    'header' => "User-Agent: weather.php/0.1(+http://ynose.weblike.jp/ichigojam_mixjuice)\r\n",
  )
);
$context = stream_context_create($opts);

// urlの作成
$city = $_GET['city'];
$url = "http://api.openweathermap.org/data/2.5/weather?q=ichihara-shi&units=metric&APPID=249b6401436860b9e0b3962d0b23c022";

echo $url.'<br/>';

// jsonの取得
//書き込む内容
$sWriteContents = file_get_contents($url, false, $context);


//ファイル名
$sFileName =         'today.json';
//ファイルパス
$todayPath =         $sFileName;

//ファイルの存在確認
if(file_exists($todayPath)){
    echo '・指定ファイルが既に存在しております。<br/>';

    //ファイルを読み込む
    if(is_readable($todayPath)){

        //ファイル内容を変数に格納
        $vContents = file_get_contents($todayPath);
        echo '・ファイル ['.$sFileName.'] 読み込み完了。<br/>';

        $json     = json_decode($vContents);

        // 今日の天気予報
        $unixtimestamp = $json->{'dt'};
        echo 'unixtimestamp:'.$unixtimestamp.'<br/>';
        $dateString = date("Y-m-d",$unixtimestamp);
        $temp_max = $json->{'main'}->{'temp_max'};

        echo '日時:'.date("Y-m-d H:i:s",$unixtimestamp).'<br/>';
        echo '最高気温:'.$temp_max.'°C<br/>';

        if($todayString == $dateString){
            echo 'today.jsonは今日のデータです！<br/>';
        } else {
            echo 'today.jsonは昨日のデータなのでyesterday.jasonにコピーします！<br/>';

            // ここでtoday.json -> jsonは昨日のデータなのでyesterday.jsonにコピーする
        }

    }else{
        echo '・ファイル ['.$sFileName.'] 読み込み失敗。<br/>';
        exit;
    }

}else{
    echo '・ファイルの存在確認完了。<br/>';
}

//ファイルを作成
if(touch($todayPath)){
    echo '・ファイル作成完了。<br/>';
}else{
    echo '・ファイル作成失敗。<br/>';
    exit;
}

//ファイルのパーティションの変更
if(chmod($todayPath,0644)){
    echo '・ファイルパーミッション変更完了。<br/>';
}else{
    echo '・ファイルパーミッション変更失敗。<br/>';
    exit;
}

//ファイルをオープン
if($filepoint = fopen($todayPath,"w")){
    echo '・ファイルオープン完了。<br/>';
}else{
    echo '・ファイルオープン失敗。<br/>';
    exit;
}

//ファイルのロック
if(flock($filepoint, LOCK_EX)){
    echo '・ファイルロック完了。<br/>';
}else{
    echo '・ファイルロック失敗。<br/>';
    exit;
}

//ファイルへ書き込み
if(fwrite($filepoint,$sWriteContents)){
    echo '・ファイル書き込み完了。<br/>';
}else{
    echo '・ファイル書き込み失敗。<br/>';
    exit;
}

//ファイルのアンロック
if(flock($filepoint, LOCK_UN)){
    echo '・ファイルアンロック完了。<br/>';
}else{
    echo '・ファイルアンロック失敗。<br/>';
    exit;
}

//today.jsonを読み込んで書き込めたかを確認する
if(is_readable($todayPath)){

    //ファイル内容を変数に格納
    $vContents = file_get_contents($todayPath);
    echo '・ファイル ['.$sFileName.'] 読み込み完了。<br/>';

    $json     = json_decode($vContents);
    echo $vContents;
    echo '<br/>';

    // 今日の天気予報
    $unixtimestamp = $json->{'dt'};
    echo 'unixtimestamp:'.$unixtimestamp.'<br/>';
    echo '日時:'.date("Y-m-d H:i:s",$unixtimestamp).'<br/>';

    $temp_max = $json->{'main'}->{'temp_max'};
    echo '最高気温:'.$temp_max.'°C<br/>';
    echo 'today.jsonはちゃんと書きこめています。<br/>';

}else{
    echo '・ファイル ['.$sFileName.'] 読み込み失敗。<br/>';
    exit;
}

//ファイルを閉じる
if(fclose($filepoint)){
    echo '・ファイルクローズ完了。<br/>';
}else{
    echo '・ファイルクローズ失敗。<br/>';
    exit;
}
?>
</body>
</html>