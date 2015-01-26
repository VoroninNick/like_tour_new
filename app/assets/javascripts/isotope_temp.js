///**
// * Created by tor on 1/15/15.
// */
//
//$( document ).ready(function() {
//    $( ".isotope-filter" ).on('click', 'label',function() {
//        var $this = $(this),
//            $parentOfClick = $this.closest('.filter-wrap'),
//            $container = $parentOfClick.find('.isotope-container'),
//            $itemSelector = $parentOfClick.attr('data-class-item'),
//            $checkboxes = $this.closest('.isotope-filter').find('input');
//
//        console.log('$this: ', $this.get(0))
//
//        $container.isotope({
//            itemSelector: $itemSelector
//        });
//        // get Isotope instance
//        var isotope = $container.data('isotope');
//        // add even classes to every other visible item, in current order
//        function addEvenClasses() {
//            isotope.$filteredAtoms.each( function( i, elem ) {
//                $(elem)[ ( i % 2 ? 'addClass' : 'removeClass' ) ]('even')
//            });
//        }
//
//        $checkboxes.change(function(){
//            var filters = [];
//            // get checked checkboxes values
//            $checkboxes.filter(':checked').each(function(){
//                filters.push( this.value );
//            });
//            // ['.red', '.blue'] -> '.red, .blue'
//            filters = filters.join(', ');
//            $container.isotope({ filter: filters });
//            addEvenClasses();
//        });
//    });
//});
//
////$(function(){
////    //var $container = $('#container'),
////    //    $checkboxes = $('#filters input');
////    //
////    //$container.isotope({
////    //    itemSelector: '.item'
////    //});
////    //// get Isotope instance
////    //var isotope = $container.data('isotope');
////    //// add even classes to every other visible item, in current order
////    //function addEvenClasses() {
////    //    isotope.$filteredAtoms.each( function( i, elem ) {
////    //        $(elem)[ ( i % 2 ? 'addClass' : 'removeClass' ) ]('even')
////    //    });
////    //}
////    //
////    //$checkboxes.change(function(){
////    //    var filters = [];
////    //    // get checked checkboxes values
////    //    $checkboxes.filter(':checked').each(function(){
////    //        filters.push( this.value );
////    //    });
////    //    // ['.red', '.blue'] -> '.red, .blue'
////    //    filters = filters.join(', ');
////    //    $container.isotope({ filter: filters });
////    //    addEvenClasses();
////    //});
////
////    //$('#shuffle').click(function(){
////    //    $container.isotope('shuffle');
////    //    addEvenClasses();
////    //});
////
////});
