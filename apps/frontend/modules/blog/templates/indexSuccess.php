      <div id="main">
        <div id="main_content2">

        <div class="sympal_markdown">
        <h1><?php echo $page_title ?>の一覧</h1>
        </div>

        <ul>
        <?php foreach ($pages as $page): ?>
            <li><?php echo $page->getFormattedFirstCommitted() ?>
                &nbsp;
                <?php echo link_to_page($page->getTitle(), $page->getPath()) ?>
            </li>
        <?php endforeach; ?>
        </ul>

        </div>
        <!-- end #main_content -->


        <div id="side_2" class="side">
<?php include_partial('archive', array('ym_index'=>$ym_index, 'page_type'=>$page_type)) ?>

<?php echo include_partial('global/global_block_docs', array('docs_pages'=>$docs_pages)) ?>

<?php echo include_partial('global/global_block_books') ?>
<?php echo include_partial('global/global_block_release', array('release'=>$release)) ?>
<?php echo include_partial('global/global_block_banner', array('banner'=>$banner)) ?>

        </div>
        <!-- end #side_1 -->

      </div>
      <!-- end #main -->
