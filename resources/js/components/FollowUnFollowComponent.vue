<template>
<div class="container">
   <button class="follow" @click="followSeries" v-text="buttonText"></button>
</div>
</template>
<script>
    export default {
        props: ['id', 'follows'],

        mounted() {
            console.log('Component mounted.')
        },

        data: function () {
            return {
                status: this.follows,
            }
        },

        methods: {
            followSeries() {
                axios.post('/series/follow/' + this.id)
                    .then(response => {
                        this.status = ! this.status;
                    })
                    
                    .catch(errors => {
                        if (errors.response.status == 401){
                        }
                    });
            }
        },

        computed: {
            buttonText() {
                return (this.status) ? 'Unfollow' : 'Follow';
            }
        }
    }
</script>
