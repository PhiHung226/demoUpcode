import React, { useState, useEffect } from 'react';
import './App.scss';
// import ColorBox from './Components/ColorBox';
import TodoList from './Components/TodoList';
import TodoForm from './Components/TodoForm';

function App() {
  const [todoList, setTodoList] = useState([
    {
      id: 1,
      title: 'I love Easy Frontend!'
    },
    {
      id: 2,
      title: 'We love Easy Frontend!'
    },
    {
      id: 3,
      title: 'Thay love Easy Frontend!'
    }
  ]);

  const [postList, setPostList] = useState([]);

  useEffect(() => {
    async function fetchPostList() {
      //....
      const requestUrl = 'http://localhost:3000/data';
      const response = await fetch(requestUrl);
      const responseJSON = await response.json();

      console.log(responseJSON);

    }
    fetchPostList();
  }, []);

  function handleTodoClick(todo) {
    console.log(todo);
    const index = todoList.findIndex(x => x.id === todo.id);
    if (index < 0) return;

    const newTodoList = [...todoList];
    newTodoList.splice(index, 1);
    setTodoList(newTodoList);
  }

  function handleTodoFormSubmit(formValues) {
    console.log('Form submit: ', formValues);
    // add new todo to current todo list
    const newTodo = {
      id: todoList.length + 1,
      ...formValues,
    }
    const newTodoList = [...todoList];
    newTodoList.push(newTodo);
    setTodoList(newTodoList);
  }

  return (
    <div className="app">
      <h1>React hooks - PostList</h1>
      {/* <TodoForm onSubmit={handleTodoFormSubmit} />
      <TodoList todos={todoList} onTodoClick={handleTodoClick} /> */}
    </div>
  );
}

export default App;
