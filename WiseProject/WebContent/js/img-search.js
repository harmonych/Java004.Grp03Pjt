
//-------------- window scrolling bottom get item 
$(window).scroll(function () {
  // test Json Text to set
  var jsonText = { "category": "creatter", "name": "alex" };
  if ($(document).height() - $(window).height() - $(document).scrollTop() < 250) {
    for (var n = 1; n <= 12; n++) {
      var $items = getItemElement(n, jsonText["category"]);
      // append elements to container
      $grid.append($items)
        // add and lay out newly appended elements
        .isotope('appended', $items).isotope('layout');
    }
  }
});
//------------ add element-item
$('.append-button').on('click', function () {
  // create new item elements
  for (var n = 1; n <= 12; n++) {
    var $items = getItemElement(n);
    // append elements to container
    $grid.append($items)
      // add and lay out newly appended elements
      .isotope('appended', $items);
  }
});
//---------set item then push to grid 
// make <div class="element-item element-item--width# element-item--height#" />
function getItemElement(n,category) {
  var $item = $('<div class="element-item"></div>');
  //  data-category="alkali"
  $item.addClass(category);
  $item.attr("data-category",category);
  $item.append('<img src="img/' + n + '.jpg" alt="..."><h3 class="name">Potassium</h3><p class="symbol">K</p><p class="number">19</p><p class="weight">39.0983</p></div>');
  // add width and height class
  // var wRand = Math.random();
  // var hRand = Math.random();
  // var widthClass = wRand > 0.85 ? 'element-item--width3' : wRand > 0.7 ? 'element-item--width2' : '';
  // var heightClass = hRand > 0.85 ? 'element-item--height3' : hRand > 0.5 ? 'element-item--height2' : '';
  // $item.addClass( widthClass ).addClass( heightClass );
  return $item;
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

