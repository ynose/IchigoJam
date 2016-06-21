<?php

// 千葉県の天気を取得
// http://ynose.weblike.jp/weather.php?city=120010&mode=w

// 千葉県の天気を最高気温
// http://ynose.weblike.jp/weather.php?city=120010&mode=t

//$url = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=010010'; // 北海道
//$url = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=020010'; // 青森県
//$url = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=030010'; // 岩手県
//$url = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=040010'; // 宮城県
//$url = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=050010'; // 秋田県
//$url = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=060010'; // 山形県
//$url = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=070010'; // 福島県
//$url = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=080010'; // 茨城県
//$url = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=090010'; // 栃木県
//$url = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=100010'; // 群馬県
//$url = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=110010'; // 埼玉県
//$url = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=120010'; // 千葉県
//$url = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=130010'; // 東京都
//$url = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=140010'; // 神奈川県
//$url = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=150010'; // 新潟県
//$url = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=160010'; // 富山県
//$url = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=170010'; // 石川県
//$url = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=180010'; // 福井県
//$url = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=190010'; // 山梨県
//$url = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=200010'; // 長野県
//$url = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=210010'; // 岐阜県
//$url = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=220010'; // 静岡県
//$url = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=230010'; // 愛知県
//$url = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=240010'; // 三重県
//$url = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=250010'; // 滋賀県
//$url = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=260010'; // 京都府
//$url = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=270010'; // 大阪府
//$url = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=280010'; // 兵庫県
//$url = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=290010'; // 奈良県
//$url = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=300010'; // 和歌山県
//$url = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=310010'; // 鳥取県
//$url = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=320010'; // 島根県
//$url = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=330010'; // 岡山県
//$url = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=340010'; // 広島県
//$url = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=350010'; // 山口県
//$url = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=360010'; // 徳島県
//$url = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=370010'; // 香川県
//$url = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=380010'; // 愛媛県
//$url = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=390010'; // 高知県
//$url = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=400010'; // 福岡県
//$url = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=410010'; // 佐賀県
//$url = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=420010'; // 長崎県
//$url = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=430010'; // 熊本県
//$url = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=440010'; // 大分県
//$url = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=450010'; // 宮崎県
//$url = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=460010'; // 鹿児島県
//$url = 'http://weather.livedoor.com/forecast/webservice/json/v1?city=470010'; // 沖縄県

$opts = array(
  'http' => array(
    'method' => "GET",
    'header' => "User-Agent: weather.php/0.1(+http://ynose.weblike.jp/ichigojam_mixjuice)\r\n",
  )
);
$context = stream_context_create($opts);

// urlの作成
$city = $_GET['city'];
$url = "http://weather.livedoor.com/forecast/webservice/json/v1?city=" . $city;
// jsonの取得
$contents = file_get_contents($url, false, $context);
$json     = json_decode($contents);
// 今日の天気予報
$tenki    = $json->{'forecasts'}[0]->{'telop'};
$temp     = $json->{'forecasts'}[0]->{'temperature'}->{'max'}->{'celsius'};
// 明日の天気予報 （今日の予報が終了していたら明日の予報に切り替える）
if (is_null($tenki) || is_null($temp)) {
  $tenki  = $json->{'forecasts'}[1]->{'telop'};
  $temp   = $json->{'forecasts'}[1]->{'temperature'}->{'max'}->{'celsius'};
}

// リターン
switch ($_GET['mode'])
{
  case 'w';
    if (preg_match("/晴/", $tenki)) {
      $w = 1;
    }
    if (preg_match("/曇/", $tenki)) {
      $w = 2;
    }
    if (preg_match("/雨/", $tenki)){
      $w = 3;
    }
    if (preg_match("/雪/", $tenki)) {
      $w = 4;
    }
    header('Content-Type: Text/Plain');
    print $w;
    print(PHP_EOL);
    break;

  case 't';
    header('Content-Type: Text/Plain');
    print $temp;
    print(PHP_EOL);
    break;
}

exit;