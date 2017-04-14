var storage = sessionStorage;
var allfund = null;
var allpro = null;
var Jdata2 = null;
var val=null;
var fcaddress=null;
var proaddress=null;
	$(document).ready(function() {
		 	    
		 	   $.ajax({
		 		    url: "\_07_funds\\allfunds.json",
		 		    type: "GET",
		 		    dataType: "json",		 		    
		 		 	}).done(function(response){
		 		 		console.log(response);
		 		 		allfund = response;
		 		 	
		 		 	for (var n = 0; n <=allfund.length-1; n++) {
		 		 		$.ajax({
				 		    url: "\_07_funds\\singleFcPic.json",
				 		    type: "GET",
				 		    dataType: "json",
				 		    async: false,
				 		    data:{
				 		    	'fc_id':allfund[n].fc_id
				 		    }
				 		 	}).done(function(fcad){
				 		 		
				 		 		fcaddress=fcad[0].fc_adress;
				 		 		
				 		});
		 		 		
		 		 	var $items = getAllFund(allfund[n].fc_id,fcaddress, "fundraising",allfund[n].fc_name);
		 		 	   // append elements to container
		 		 	   $grid.append($items).isotope('layout')
		 		 	     // add and lay out newly appended elements
		 		 	     .isotope('appended', $items);
		 		 	
		 		 	}
		 		 	
		 		 	});
		 	   
		 	   
			   $.ajax({
		 		    url: "\_08_product\\allproduct.json",
		 		    type: "GET",
		 		    dataType: "json",		 		    
		 		 	}).done(function(response1){
		 		 		console.log(response1);
		 		 		allpro = response1;
		 		 
		 		 	for (var n = 0; n <= allpro.length-1; n++) {
		 		 		$.ajax({
				 		    url: "\_08_product\\singlepropic.json",
				 		    type: "GET",
				 		    dataType: "json",
				 		    async: false,
				 		    data:{
				 		    	'pro_id':allpro[n].pro_id
				 		    }
				 		 	}).done(function(proad){
				 		 		
				 		 		proaddress=proad[0].pic_adress;
				 		 		
				 		});
		 		 		
		 		 		 		 		
		 		 		var $items2 = getAllPro(allpro[n].pro_id,proaddress, "product", allpro[n].pro_name);
		 		 	   // append elements to container
		 		 	   $grid.append($items2).isotope('layout')
		 		 	     // add and lay out newly appended elements
		 		 	     .isotope('appended', $items2);
		 		 	}
		 		 	}); 
			   $.ajax({
		 		    url: "\_08_ImgSearch\\searchAllArtist.json",
		 		    type: "GET",
		 		    dataType: "json",		 		    
		 		 	}).done(function(response2){
		 		 		console.log(response2);
		 		 		Jdata2 = response2;
		 		 
		 		 	for (var n = 0; n <= Jdata2.length-1; n++) {
		 		 	var $items3 = getItemElement2(Jdata2[n][0],Jdata2[n][1], "creatter",Jdata2[n][2]);
		 		 	   // append elements to container
		 		 	   $grid.append($items3).isotope('layout')
		 		 	     // add and lay out newly appended elements
		 		 	     .isotope('appended', $items3);
		 		 	}
		 		 	});
		 	  });
	$(document).submit(function(e){
		
		if(val!=null)val=null;
		val = $('input[name="search"]').val();
		
			$('input').val("");
		
		e.preventDefault();
		
		if(storage['search'] != null){
			storage['search'] = "";
			storage.setItem('search',val);
		}
		
		$("#searchbox").empty();
		
		$.ajax({
			    url: "\_10_search\\search.json",
			    type: "GET",
			    dataType: "json",	
			    data:{
			    	'search':val
			    }
			 	}).done(function(response){
			 		allfund = response;
			 		
			 	if(allfund.length != 0){
			 	for (var n = 0; n <= allfund.length-1; n++) {
			 		$.ajax({
			 		    url: "\_07_funds\\singleFcPic.json",
			 		    type: "GET",
			 		    dataType: "json",
			 		    async: false,
			 		    data:{
			 		    	'fc_id':allfund[n].fc_id
			 		    }
			 		 	}).done(function(fcad){
			 		 		
			 		 		fcaddress=fcad[0].fc_adress;
			 		 		
			 		});
	 		 		
	 		 	var $items = getAllFund(allfund[n].fc_id,fcaddress, "fundraising",allfund[n].fc_name);
	 		 	   // append elements to container
	 		 	   $grid.append($items).isotope('layout')
	 		 	     // add and lay out newly appended elements
	 		 	     .isotope('appended', $items);
	 		 	
	 		 	
			 	}
			 	}
			 	});
		 
	   $.ajax({
			    url: "\_10_search\\searchp.json",
			    type: "GET",
			    dataType: "json",	
			    data:{
			    	'search':val
			    }
			 	}).done(function(response1){
			 		console.log(response1);
			 		allpro = response1;
			 	if(allpro.length != 0){
			 	for (var n = 0; n <= allpro.length-1; n++) {
			 		$.ajax({
			 		    url: "\_08_product\\singlepropic.json",
			 		    type: "GET",
			 		    dataType: "json",
			 		    async: false,
			 		    data:{
			 		    	'pro_id':allpro[n].pro_id
			 		    }
			 		 	}).done(function(proad){
			 		 		
			 		 		proaddress=proad[0].pro_adress;
			 		 		
			 		});
	 		 		
	 		 		 		 		
	 		 		var $items2 = getAllPro(allpro[n].pro_id,proaddress, "product",allpro[n].pro_name);
	 		 	   // append elements to container
	 		 	   $grid.append($items2).isotope('layout')
	 		 	     // add and lay out newly appended elements
	 		 	     .isotope('appended', $items2);
	 		 	}
			 		
			 		
			 	}
			 	}); 
	   $.ajax({
			    url: "\_10_search\\searcha.json",
			    type: "GET",
			    dataType: "json",	
			    data:{
			    	'search':val
			    }
	   			}).done(function(response2){
			 		console.log(response2);
			 		Jdata2 = response2;
			 		
			 	if(Jdata2.length != 0){
			 	for (var n = 0; n < Jdata2.length; n++) {
			 	var $items3 = getItemElement2(Jdata2[n].art_id,Jdata2[n].memberbean.file_name, "creatter",Jdata2[n].memberbean.user_name);
			 	   // append elements to container
			 	   $grid.append($items3).isotope('layout')
			 	     // add and lay out newly appended elements
			 	     .isotope('appended', $items3);
			 	}
			 	}
		console.log(allfund)
		console.log(allpro)
		console.log(Jdata2)
	   if(allfund.length==0&&allpro.length==0&&Jdata2.length==0){
			$("#searchfont").append("<h2>找不到符合搜尋字詞的文件。<h2>");
		}  
			 	});
		
		
	});
	console.log(storage);
//-------------- window scrolling bottom get item 
//$(window).scroll(function () {
//  // test Json Text to set
//  
//  if ($(document).height() - $(window).height() - $(document).scrollTop() < 250) {
//    for (var n = 1; n <= 6; n++) {
//    	
//      var $items = getAllFund(n, "fundraising",allfund[n].fc_name);
//      // append elements to container
//      $grid.append($items).isotope('layout')
//        // add and lay out newly appended elements
//        .isotope('appended', $items);
//    }
//  }
//});
//------------ add element-item

//按鈕增加圖片
 $('.append-button').on('click', function () {
   // create new item elements
   for (var n = 1; n <= 6; n++) {
	   var  $items = getAllFund(n, "fundraising",allfund[n].fc_name);
	      // append elements to container
	      $grid.append($items).isotope('layout')
	        // add and lay out newly appended elements
	        .isotope('appended', $items);
   }
 });
 
 $('.cancel-search').on('click', function () {
	 $("#searchbox").empty();
	 $.ajax({
		    url: "\_07_funds\\allfunds.json",
		    type: "GET",
		    dataType: "json",		 		    
		 	}).done(function(response){
		 		console.log(response);
		 		allfund = response;
		 
		 	for (var n = 0; n <= allfund.length-1; n++) {
		 		$.ajax({
		 		    url: "\_07_funds\\singleFcPic.json",
		 		    type: "GET",
		 		    dataType: "json",
		 		    async: false,
		 		    data:{
		 		    	'fc_id':allfund[n].fc_id
		 		    }
		 		 	}).done(function(fcad){
		 		 		
		 		 		fcaddress=fcad[0].fc_adress;
		 		 		
		 		});
 		 		
 		 	var $items = getAllFund(allfund[n].fc_id,fcaddress, "fundraising",allfund[n].fc_name);
 		 	   // append elements to container
 		 	   $grid.append($items).isotope('layout')
 		 	     // add and lay out newly appended elements
 		 	     .isotope('appended', $items);
 		 	
 		 	
		 	}
		 	});
	   
	   
	   $.ajax({
		    url: "\_08_product\\allproduct.json",
		    type: "GET",
		    dataType: "json",		 		    
		 	}).done(function(response1){
		 		console.log(response1);
		 		allpro = response1;
		 
		 	for (var n = 0; n <= allpro.length-1; n++) {
		 		$.ajax({
		 		    url: "\_08_product\\singlepropic.json",
		 		    type: "GET",
		 		    dataType: "json",
		 		    async: false,
		 		    data:{
		 		    	'pro_id':allpro[n].pro_id
		 		    }
		 		 	}).done(function(proad){
		 		 		
		 		 		proaddress=proad[0].pic_adress;
		 		 		
		 		});
 		 		
 		 		 		 		
 		 		var $items2 = getAllPro(allpro[n].pro_id,proaddress, "product",allpro[n].pro_name);
 		 	   // append elements to container
 		 	   $grid.append($items2).isotope('layout')
 		 	     // add and lay out newly appended elements
 		 	     .isotope('appended', $items2);
 		 	}
		 	}); 
	   $.ajax({
		    url: "\_08_ImgSearch\\searchAllArtist.json",
		    type: "GET",
		    dataType: "json",		 		    
		 	}).done(function(response2){
		 		console.log(response2);
		 		Jdata2 = response2;
		 
		 	for (var n = 0; n <= Jdata2.length-1; n++) {
//		 	var $items3 = getItemElement2(Jdata2[n].art_id,Jdata2[n].memberbean.file_name, "creatter",Jdata2[n].memberbean.user_name);
//		 	   // append elements to container
//		 	   $grid.append($items3).isotope('layout')
//		 	     // add and lay out newly appended elements
//		 	     .isotope('appended', $items3);
		 		var $items3 = getItemElement2(Jdata2[n][0],Jdata2[n][1], "creatter",Jdata2[n][2]);
			 	$grid.append($items3).isotope('layout')
			 	.isotope('appended', $items3);
		 	}
		 	});
	 });
//---------set item then push to grid 
// make <div class="element-item element-item--width# element-item--height#" />
function getAllFund(id,address,category,name) {
  var $item = $('<div class="element-item"></div>');
  //  data-category="alkali"
  $item.addClass(category);
  $item.attr("data-category","fundraising");
  $item.append('<img src="' + address + '" class="img-link" id="ip_fc_id'+id+'" alt="..."><h3 class="name">'+name+'</h3><p class="symbol"></p><p class="number"></p><p class="weight"></p></div>');
  // add width and height class
  // var wRand = Math.random();
  // var hRand = Math.random();
  // var widthClass = wRand > 0.85 ? 'element-item--width3' : wRand > 0.7 ? 'element-item--width2' : '';
  // var heightClass = hRand > 0.85 ? 'element-item--height3' : hRand > 0.5 ? 'element-item--height2' : '';
  // $item.addClass( widthClass ).addClass( heightClass );
  return $item;
}
function getAllPro(id,address,category,name) {
	  var $item2 = $('<div class="element-item"></div>');
	  //  data-category="alkali"
	  $item2.addClass(category);
	  $item2.attr("data-category",category);
	  $item2.append('<img src="' + address + '" class="img-link" id="ip_pro_id'+id+'" alt="..."><h3 class="name">'+name+'</h3><p class="symbol"></p><p class="number"></p><p class="weight"></p></div>');
	  // add width and height class
	  // var wRand = Math.random();
	  // var hRand = Math.random();
	  // var widthClass = wRand > 0.85 ? 'element-item--width3' : wRand > 0.7 ? 'element-item--width2' : '';
	  // var heightClass = hRand > 0.85 ? 'element-item--height3' : hRand > 0.5 ? 'element-item--height2' : '';
	  // $item.addClass( widthClass ).addClass( heightClass );
	  return $item2;
	}
function getItemElement2(id,file,category,name) {
	  var $item3 = $('<div class="element-item"></div>');
	  //  data-category="alkali"
	  $item3.addClass(category);
	  $item3.attr("data-category",category);
	  $item3.append('<img src="'+file+'" class="img-link" id="ip_ar_id'+id+'" alt="..."><h3 class="name">'+name+'</h3><p class="symbol"></p><p class="number"></p><p class="weight"></p></div>');
	  // add width and height class
	  // var wRand = Math.random();
	  // var hRand = Math.random();
	  // var widthClass = wRand > 0.85 ? 'element-item--width3' : wRand > 0.7 ? 'element-item--width2' : '';
	  // var heightClass = hRand > 0.85 ? 'element-item--height3' : hRand > 0.5 ? 'element-item--height2' : '';
	  // $item.addClass( widthClass ).addClass( heightClass );
	  return $item3;
	}

//------------ add element-item end
// init Isotope
var $grid = $('.grid').isotope({
  itemSelector: '.element-item',
  layoutMode: 'masonry',
  masonry: {
    columnWidth: 70,
    isFitWidth: true
  },
  getSortData: {
    name: '.name',
    symbol: '.symbol',
    number: '.number parseInt',
    category: '[data-category]',
    weight: function (itemElem) {
      var weight = $(itemElem).find('.weight').text();
      return parseFloat(weight.replace(/[\(\)]/g, ''));
    }
  }
});

// filter functions
var filterFns = {
  // show if number is greater than 50
  numberGreaterThan50: function () {
    var number = $(this).find('.number').text();
    return parseInt(number, 10) > 50;
  },
  // show if name ends with -ium
  ium: function () {
    var name = $(this).find('.name').text();
    return name.match(/ium$/);
  }
};

// bind filter button click
$('#filters').on('click', 'button', function () {
  var filterValue = $(this).attr('data-filter');
  // use filterFn if matches value
  filterValue = filterFns[filterValue] || filterValue;
  $grid.isotope({ filter: filterValue });
});

// bind sort button click
$('#sorts').on('click', 'button', function () {
  var sortByValue = $(this).attr('data-sort-by');
  $grid.isotope({ sortBy: sortByValue });
});

// change is-checked class on buttons
$('.button-group').each(function (i, buttonGroup) {
  var $buttonGroup = $(buttonGroup);
  $buttonGroup.on('click', 'button', function () {
    $buttonGroup.find('.is-checked').removeClass('is-checked');
    $(this).addClass('is-checked');
  });
});



