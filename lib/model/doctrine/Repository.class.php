<?php

/**
 * Repository
 *
 * This class has been auto-generated by the Doctrine ORM Framework
 *
 * @package sfjp
 * @subpackage model
 * @author hidenorigoto
 * @version SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
class Repository extends BaseRepository {

    /**
     * Repository::setBindPath()
     *
     * @param mixed $path
     * @return
     * @throws  Exception  パスに不正な文字が含まれている場合
     */
    public function setBindPath($path)
    {
        // 不正な文字をチェック
        if (preg_match('/[^a-zA-Z0-9\/\-_+*()!"$%&^=:;\\[\]]/i', $path)) {
            throw new Exception('Invalid path is specified.');
        }

        // 先頭はスラッシュあり、末尾のスラッシュは無視
        if (substr($path, 0, 1) !== '/') {
            $path = '/' . $path;
        }
        if (substr($path, -1, 1) === '/') {
            $path = substr($path, 0, -1);
        }
        $this->_set('bind_path', $path);
    }

    /**
     * Repository::getCacheKey()
     * リポジトリを取得するキャッシュのキー（ディレクトリ）を求める
     *
     * @return string
     */
    public function getCacheKey()
    {
        // 結合するパスの/をXXに変換する。
        if ($path = $this->getBindPath()) {
            return str_replace('/', 'XX', $path);
        }else {
            return 'XX';
        }
    }

    /**
     * Repository::getRepositoryName()
     *　リポジトリURLの名前部分を取得する。
     *
     * @return string
     */
    public function getRepositoryName()
    {
        $info = pathinfo($this->getRepository());
        return $info['filename'];
    }

    /**
     * Repository::getPublicDirectory()
     * このリポジトリに対するパブリックディレクトリの物理パスを取得する。
     *
     * @return string
     */
    public function getPublicDirectory($realpath = true)
    {
        if ($realpath) {
            return sfConfig::get('sf_web_dir')
                   . DIRECTORY_SEPARATOR
                   . 'r'
                   . DIRECTORY_SEPARATOR
                   . 'images'
                   . $this->getBindPath();
        } else {
            return public_path('r/images' . $this->getBindPath());
        }
    }

    /**
     * Repository::getImagePublicPath()
     * このリポジトリ内の相対パスで指定された画像ファイルに対応する、パブリックディレクトリ内のパス
     * 物理パス
     *
     * @param mixed $relative_path
     * @return string
     */
    public function getImagePublicPath($relative_path)
    {
        $path = $this->getPublicDirectory()
              . DIRECTORY_SEPARATOR
              . $relative_path;

        return $path;
    }

    /**
     * Repository::getRepositoryHttp()
     * このリポジトリのgithub URLを取得する。
     * （git://の場合は変換する）
     * 末尾の.gitも削除される。
     *
     * @return  string
     */
    public function getRepositoryHttp()
    {
        $repository_url = $this->getRepository();
        $repository_url = preg_replace('/^git(.*)$/i',
                            'http$1', $repository_url);
        $repository_url = preg_replace('/^https(.*)$/i',
                            'http$1', $repository_url);
        $repository_url = preg_replace('/^(.*)\.git$/i',
                            '$1', $repository_url);

        return $repository_url;
    }
}