function debounce(callback, delay){
    let timer;
    return function(){
        let args = arguments;
        let context = this;
        clearTimeout(timer);
        timer = setTimeout(function(){
            callback.apply(context, args);
        }, delay)
    }
}

class LinkedSelect {

    /**
     * @param {HTMLSelect}  $select
     */
    constructor ($select) {
        this.$select = $select
        this.$target = document.querySelector(this.$select.dataset.target)
        this.$placeholder =  this.$target.firstElementChild
        this.onChange = debounce(this.onChange.bind(this), 500)
        this.$loader = null
        this.cache = { }
        this.$select.addEventListener('change', this.onChange)
    }
    /**
     * Se déclenche au changement de valeur d'un select
     * @param {Event} e 
     */
    onChange (e){
        if(e.target.value === '0' ){
            return
        }
        this.loadOptions(e.target.value, (options) => {
            this.$target.innerHTML = options
            this.$target.insertBefore(this.$placeholder, this.$target.firstChild)
            this.$target.selectedIndex = 0
            this.$target.style.display = null
            document.getElementById('titre1').style.visibility = "visible"
            if(this.$target.name === 'personnages'){
                document.getElementById('titre2').style.visibility = "visible"
                if(this.$target.value != '0'){
                    document.getElementById('panel').style.visibility = "visible"
                }
            }  
        })
    }
    /**
     * 
     * @param {string} id 
     * @param {function} callback 
     */
    loadOptions (id, callback){
        if(this.cache[id]){
            callback(this.cache[id])
            return
        }
        this.showLoader()
        //On récupère les données en Ajax
        let request = new XMLHttpRequest()
        request.open('GET', this.$select.dataset.source.replace('$id', id), true)
        request.onload = () => {
            if(request.status >= 200 && request.status < 400) {
                let data = JSON.parse(request.responseText)
                let options = data.reduce(function(acc, option){
                    return acc + '<option value="' + option.value +'">'+ option.label + '</option>'
                }, '')
                this.cache[id] = options
                this.hideLoader()
                callback(options)
            }
            else{
                alert('Impossible de charger la liste')
            }
        }
        request.onerror = function () {
            alert('Impossible de charger la liste')
        }
        request.send()
        //On inject les données dans le prochain select
    }

    showLoader (){
        this.$loader = document.createTextNode('Chargement...')
        this.$target.parentNode.appendChild(this.$loader)
    }

    hideLoader (){
        if(this.$loader !== null){
            this.$loader.parentNode.removeChild(this.$loader)
            this.$loader = null    
        }
    }
}

//Le $ spécifie que ce sont des variables qui recupère des donner via le DOM
let $selects = document.querySelectorAll('.linked-select')

$selects.forEach(function ($select){
    new LinkedSelect($select)
}) 