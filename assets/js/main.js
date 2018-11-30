// Initialize collasable
M.Collapsible.init(document.querySelector('.collapsible'), {});

// Init sidenav
M.Sidenav.init(document.querySelector('.sidenav'), {});

// Init profile dropdown
M.Dropdown.init(document.querySelectorAll('.dropdown-trigger'), {
    hover: true,
    constrainWidth: false
});

// Release year slider
noUiSlider.create(document.getElementById('rel-year-range'), {
    start: [1990, 2010],
    connect: true,
    step: 2,
    orientation: 'horizontal',
    range: {
        'min': 1970,
        'max': 2018
    },
    format: wNumb({
        decimals: 0
    })
});

// Page slider
noUiSlider.create(document.getElementById('page-range'), {
    start: [20, 400],
    connect: true,
    step: 5,
    orientation: 'horizontal',
    range: {
        'min': 20,
        'max': 400
    },
    format: wNumb({
        decimals: 0
    })
});