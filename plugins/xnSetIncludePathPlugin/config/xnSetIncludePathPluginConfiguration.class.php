<?php

/**
 * xnSetIncludePathPlugin configuration.
 *
 * @package     xnSetIncludePathPlugin
 * @subpackage  config
 * @author      Your name here
 * @version     SVN: $Id: PluginConfiguration.class.php 17207 2009-04-10 15:36:26Z Kris.Wallsmith $
 */
class xnSetIncludePathPluginConfiguration extends sfPluginConfiguration
{
  const VERSION = '1.0.0-DEV';

  /**
   * @see sfPluginConfiguration
   */
  public function initialize()
  {
    //  config.phpで処理する。
    return false;
  }
}
