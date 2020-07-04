<template>
    <div  style="display:inline-table">
       <a href="http://"><i @click.prevent="likeEpisode" class="fa fa-thumbs-up" aria-hidden="true"></i>({{ totallike }})</a>
    </div>
</template>
<script>
    export default {
        props:['episode'],
        data(){
            return {
                totallike:'',
                processing: false
            }
        },
        methods:{
            likeEpisode(){
                if (this.processing === true) {
                    return;
                } 
                this.processing = true;
                axios.post('/like/'+this.episode)
                .then(response =>{
                    this.getlike()
                    this.processing = false;
                })
                .catch()
            },
            getlike(){
                axios.post('/like',{episode:this.episode})
                .then(response =>{
                    this.totallike = response.data.total
                })
            }
        },
        mounted() {
            this.getlike()
        }
    }
</script> 