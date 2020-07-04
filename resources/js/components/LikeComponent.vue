<template>
    <div class="container">
        <p id="success"></p>
       <a href="http://"><i @click.prevent="likeEpisode" class="fa fa-thumbs-up" aria-hidden="true"></i>({{ totallike }})</a>
    </div>
</template>
<script>
    export default {
        props:['episode'],
        data(){
            return {
                totallike:'',
            }
        },
        methods:{
            likeEpisode(){
                axios.post('/like/'+this.episode)
                .then(response =>{
                    this.getlike()
                    $('#success').html(response.data.message)
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