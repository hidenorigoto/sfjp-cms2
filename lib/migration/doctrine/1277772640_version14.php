<?php
/**
 * This class has been auto-generated by the Doctrine ORM Framework
 */
class Version14 extends Doctrine_Migration_Base
{
    public function up()
    {
        $this->addColumn('page', 'first_committed_ym', 'integer', '8', array(
             'default' => '0',
             ));
    }

    public function down()
    {
        $this->removeColumn('page', 'first_committed_ym');
    }
}