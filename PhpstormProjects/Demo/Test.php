<?php
/**
 * Created by PhpStorm.
 * User: qitmac000240
 * Date: 16/8/10
 * Time: 下午5:53
 */

/**$x=5;
$y=6;
$z=$x+$y;
echo $z;

$txt = "baige";

echo $txt;


$x=5; // 全局变量

function myTest()
{
    $y=10; // 局部变量
    echo "<p>测试函数内变量:<p>";
    echo "变量 x 为: $x";
    echo "<br>";
    echo "变量 y 为: $y";
}

myTest();

echo "<p>测试函数外变量:<p>";
echo "变量 x 为: $x";
echo "<br>";
echo "变量 y 为: $y";


$txt1="Learn PHP";
$txt2="w3cschool.cc";
$cars=array("Volvo","BMW","Toyota");

echo $txt1;
echo "<br>";
echo "Study PHP at $txt2";
echo "My car is a {$cars[0]}";


$x = 5;
$y = 6;

function myTest(){

    global $x,$y;
    $y = $x+$y;
    echo "y = $y";

}

myTest();

echo "<p>y : $y<p>";

function myTest(){

    static  $x = 0;
    echo $x;
    $x++;
}

myTest();
myTest();
myTest();


$one = "baiqil";
$two = 12;

echo $one,$two,"\n";

print $one;

print "\n";

$x = "hello work";

echo $x,"\n";

$x = 'hello work!';

echo $x;

echo "\n",'bai';

$x = array('1','2','3');

var_dump($x[1]);

class Car{

    var $color;

    function Car($color = 'green'){

        $this->color = $color;
    }

    function what_color(){

        return $this->color;
    }

}

$baibai = new Car('green');

echo $baibai->color;

echo '\n';

$baibai->Car11('red');

echo $baibai->color;

echo '\n';

echo $baibai->what_color();


define('BAIQILONG','欢迎您');

echo BAIQILONG;


echo $_SERVER['PHP_SELF'];
echo "<br>";
echo $_SERVER['SERVER_NAME'];
echo "<br>";
echo $_SERVER['HTTP_HOST'];
echo "<br>";
echo $_SERVER['HTTP_REFERER'];
echo "<br>";
echo $_SERVER['HTTP_USER_AGENT'];
echo "<br>";
echo $_SERVER['SCRIPT_NAME'];
 */



?>