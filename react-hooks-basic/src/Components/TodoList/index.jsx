//rsfp
import React from 'react';
import PropTypes from 'prop-types';

TodoList.propTypes = {
    todos: PropTypes.array,
    onTodoClick: PropTypes.func,
};
TodoList.defaultProps = {
    todos: [],
    onTodoClick: null,
}

function TodoList(props) {
    const { todos, onTodoClick } = props;

    function handleClick(todo) {
        if (onTodoClick) {
            onTodoClick(todo);
        }
    }
    return (
        <div className="todo-list">
            {todos.map((todo, index) => (
                <li key={index}
                    onClick={() => handleClick(todo)}>{todo.title}</li>
            ))}
        </div>
    );
}

export default TodoList;