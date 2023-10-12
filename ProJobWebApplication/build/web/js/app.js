// category list
const listCategory = document.querySelector('#category')
const filterCategory = document.querySelector('.filter-category-wrapper')
const ul = document.querySelector('.filter-category')

const cityArr = ['Ho Chi Minh', 'Can Tho', 'Da Nang']
const sectorArr = ['Software Engineer', 'Front End Developer', 'Back End Developer']
const timeArr = ['Part-time', 'Full-time']
const salaryArr = ['greater than 10tr','less than 20tr']

function innitListCategoryRight() {
    cityArr.map(city => { 
        ul.innerHTML += `<li class="filter-category_item">${city}</li>`
    }) 

    /***************************************************************************/
    const tabBox = document.querySelector('.filter-category')
    const allTabs = document.querySelectorAll('.filter-category_item')
    const arrowIcon = document.querySelectorAll('.filter-category-wrapper button')
    const idBtn = 'leftBtnFilter'
    const activeClass = '.filter-category_item.active'
    // handle scroll x
    scrollX(arrowIcon, tabBox, idBtn)
    // handle choose item
    activeElement(allTabs, activeClass)
}

innitListCategoryRight()

listCategory.addEventListener('change',() => {
    ul.innerHTML = ""
    switch (listCategory.value) {        
        case "sector":                  
            sectorArr.map(sector => { 
                    ul.innerHTML += `<li class="filter-category_item">${sector}</li>`
                })             
            break;    
        case "area":                  
            cityArr.map(city => { 
                    ul.innerHTML += `<li class="filter-category_item">${city}</li>`
                })             
            break;    
        case "time":                  
            timeArr.map(time => { 
                    ul.innerHTML += `<li class="filter-category_item">${time}</li>`
                })             
            break;    
        case "salary":                  
            salaryArr.map(salary => { 
                    ul.innerHTML += `<li class="filter-category_item">${salary}</li>`
                })             
            break;    
    }

        /***************************************************************************/
        const tabBox = document.querySelector('.filter-category')
        const allTabs = document.querySelectorAll('.filter-category_item')
        const arrowIcon = document.querySelectorAll('.filter-category-wrapper button')
        const idBtn = 'leftBtnFilter'
        const activeClass = '.filter-category_item.active'
        // handle scroll x
        scrollX(arrowIcon, tabBox, idBtn)
        // handle choose item
        activeElement(allTabs, activeClass)
})


// top of the company scroll
const blog_list = document.querySelector('.comp-list_card')
const BtnComp = document.querySelectorAll('.comp-btn button')
const idBtn = 'leftBtnComp'

scrollX(BtnComp, blog_list, idBtn)

// paginaton
const itemBlog = [
    {
        name: 'Comp Name',
        description: 'job description'
    },
    {
        name: 'Comp Name',
        description: 'job description'
    },
    {
        name: 'Comp Name',
        description: 'job description'
    },
    {
        name: 'Comp Name',
        description: 'job description'
    },
    {
        name: 'Comp Name',
        description: 'job description'
    },
    {
        name: 'Comp Name111',
        description: 'job description'
    },
    {
        name: 'Comp Name',
        description: 'job description'
    },
    {
        name: 'Comp Name111',
        description: 'job description'
    },
    {
        name: 'Comp Name111',
        description: 'job description'
    },
    {
        name: 'Comp Name111',
        description: 'job description'
    },
    {
        name: 'Comp Name111',
        description: 'job description'
    },
    {
        name: 'Comp Name111',
        description: 'job description'
    },
]
const pagiControl = document.querySelectorAll('.pagi-control button')
const postList = document.querySelector('.post_list')
const btnLeftPagination = document.querySelector('#btnLeftPagination')
const btnRightPagination = document.querySelector('#btnRightPagination')
const currentPageTag = document.querySelector('#currentPageTag')
const totalPageTag = document.querySelector('#totalPage')

let curentPage = 1;
let itemPerPage = 6;
let totalPage = itemBlog.length / itemPerPage;
let start = 0;
let end = 0;

pagination(0, 6)
totalPageTag.innerText = totalPage

if(curentPage == 1){
    btnLeftPagination.classList.add('disabled');
}

pagiControl.forEach((btn) => {
    const btnPagination = btn.addEventListener('click', () =>{  
        switch(btn.id) {
            case 'btnLeftPagination':              
                if(curentPage <= totalPage && curentPage > 1){
                    curentPage--
                    start = (curentPage - 1) * itemPerPage;
                    end = curentPage*itemPerPage;
                    pagination(start, end)         
                    btnRightPagination.classList.remove('disabled');                                        
                } 
            break;
            case 'btnRightPagination':               
                 if(curentPage > 0 && curentPage < totalPage){
                btnLeftPagination.classList.remove('disabled');
                    curentPage++
                    start = (curentPage - 1) * itemPerPage;
                    end = curentPage*itemPerPage;
                    pagination(start, end)
                }                 
            break; 

        }
        if(curentPage == 1){
            btnLeftPagination.classList.add('disabled');
        }
        if( curentPage == totalPage){                
            btnRightPagination.classList.add('disabled');
        } 
        currentPageTag.innerText = curentPage
    })

    

  
})

function pagination(start, end) {
    postList.innerHTML = ""
    for (let index = start; index < end; index++) {                
        postList.innerHTML += `<div class="col-12 col-sm-6 mb-3 col-md-4 blog-wrap_item blog-wrap_item-hover">
                                    <div class="blog_item card">
                                    <div class="card-body d-flex">
                                        <img class="rounded-circle me-2" width="50px" height="50px" src="images/carousel1.png" alt="">
                                        <div class="bog_item-content">
                                        <p class="card-title">${itemBlog[index].name}</p>
                                        <span class="card-text">${itemBlog[index].description}</span>
                                        </div>
                                    </div>
                                    </div>
                                </div>`         
   }
}








//the common function
function scrollX(arrowIcon, tabBox, idBtn){
    arrowIcon.forEach( btnIcon => {
        btnIcon.addEventListener('click', () => {
         tabBox.scrollLeft += btnIcon.id === idBtn ?
            -232.8 : 232.8;    
        console.log(tabBox.scrollLeft);                   
        })
    })
}

function activeElement(allTabs, activeClass) {
    allTabs.forEach( item => {
        item.addEventListener('click', (e) => {
            let itemActive = document.querySelector(activeClass)
            itemActive !== null ? itemActive.classList.remove('active'):
            itemActive
            e.target.classList.add('active')
        });  
    })
}





