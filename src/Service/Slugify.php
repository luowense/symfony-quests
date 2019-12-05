<?php


namespace App\Service;


class Slugify
{
    public function generate(string $str)
    {
        $str = mb_strtolower($str);
        $str = utf8_decode($str);
        $str = strtr($str, utf8_decode('àâäãáåçéèêëíìîïñóòôöõøùúûüýÿ'), 'aaaaaaceeeeiiiinoooooouuuuyy');
        $str = preg_replace('`[^a-z0-9]+`', '-', $str);
        $str = trim($str, '-');

        return $str;
    }
}
