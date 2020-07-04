<template>
    <div class="container">
        <p id="success"></p>
       <a href="http://"><i @click.prevent="disLikeEpisode" class="fa fa-thumbs-down" aria-hidden="true"></i>({{ totalDislike }})</a>
    </div>
</template>

<script>
    export default {
        props:['episode'],
        data(){
            return {
                totalDislike:'',
            }
        },
        methods:{
            disLikeEpisode(){
                axios.post('/dislike/'+this.episode)
                .then(response =>{
                    this.getDislike()
                    $('#success').html(response.data.message)
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