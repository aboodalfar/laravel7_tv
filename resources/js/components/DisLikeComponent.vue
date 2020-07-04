<template>
    <div  style="display:inline-table">
       <a href="http://"><i @click.prevent="disLikeEpisode" class="fa fa-thumbs-down" aria-hidden="true"></i>({{ totalDislike }})</a>
    </div>
</template>

<script>
    export default {
        props:['episode'],
        data(){
            return {
                totalDislike:'',
                processing: false
            }
        },
        methods:{
            disLikeEpisode(){
               if (this.processing === true) {
                    return;
                } 
                this.processing = true;
                axios.post('/dislike/'+this.episode)
                .then(response =>{
                    this.getDislike()
                    this.processing = false
                })
                .catch()
            },
            getDislike(){
                axios.post('/dislike',{episode:this.episode})
                .then(response =>{
                    this.totalDislike = response.data.total
                })
            }
        },
        mounted() {
            this.getDislike()
        }
    }
</script> 