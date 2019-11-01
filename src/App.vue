<template>
  <div class="fullBody">

  <md-card >
      <md-card-header class="titleBar">
        <h1>Organize Your Objectives!</h1> 
        <br>
        <h3>Enter Task Below</h3>
      </md-card-header>
  </md-card>
      <md-card>
           
           <md-field>
            <md-input v-model='currentTodo' @keydown.enter='addTodo()' placeholder="Add A To Do"></md-input>
         </md-field>
         
              <md-list class="todos">
                <md-list-item v-for='(todo, index) in todos' :key='todo.id'>
                  <input class='checkBtn' type='checkbox' v-model='todo.completed' >
                    
                      <span class="todo-item-label" :class='{completed: todo.completed}' @dblclick='editTodo(todo)' v-if="!todo.edit">
                          {{todo.label}}
                      </span> 
                    
                        <input v-else class="todo-item-edit" type="text" v-model='todo.label' @blur="doneEdit(todo)" @keyup.enter="doneEdit(todo)" @keyup.escape="doneEdit(todo)"> 
                       
                  <md-button class="removeBtn md-raised md-primary" @click="removeTodo(index)">Remove</md-button>
                  </md-list-item>
                  </md-list>
                
      </md-card>
  </div>
</template>

<script>

export default {
  data() {
    return {
      todos: [],
      currentTodo: ' ',
      editedTodo: null
    }
  },
  methods: {
      addTodo() {

        if (this.currentTodo.trim() == 0) {
          return
        }
        this.todos.push({
          id:this.todos.length, 
          label: this.currentTodo, 
          completed: false, 
          edit: false
        });
        this.currentTodo = ' ';
      },
      removeTodo(index) {
        this.todos.splice(index,1)
      },
      editTodo(todo) {
        todo.edit = true
      },
      doneEdit(todo) {
        todo.edit = false
      }
  }
}
</script>

<style>
.titleBar{
  background-color:rgb(77, 0, 153);
  color:white;
  font-variant:small-caps;
}
.todos{
  font-variant:small-caps;
}

.fullBody{
  width:40%;
  height:120%;
  margin:auto;
  margin-top:15px;
  text-align:center;
  border:2px solid grey;
  padding:15px;
  border-radius:5px;
   background-image: linear-gradient(70deg,rgb(204, 153, 255),white)
  
 
}

.checkBtn{
  float:left;
}
.removeBtn{
  float:right;
  font-variant:small-caps;
}
.completed{
  color:red;
}



</style>