// src/Forum.js

import React, { useState, useEffect } from "react";
import axios from "axios";

const Forum = () => {
	const [todos, setTodos] = useState([]);
	const [newTodoTitle, setNewTodoTitle] = useState("");

	const BASE_TODO_URL = "http://localhost:8080/api/v1/todo";

	const addTodo = async (title) => {
		try {
			const options = {
				headers: {
					"Access-Control-Allow-Origin": "*",
				},
			};
			const response = await axios.post(
				BASE_TODO_URL,
				{ title },
				options
			);

			setTodos([...todos, response.data]);
			setNewTodoTitle("");
		} catch (error) {
			console.error("Error creating post:", error);
		}
	};

	useEffect(() => {
		const fetchTodos = async () => {
			try {
				const options = {
					headers: {
						"Access-Control-Allow-Origin": "*",
					},
				};
				const response = await axios.get(BASE_TODO_URL, options);
				setTodos(response.data);
				console.log("response", response.data);
			} catch (error) {
				console.error("Error fetching posts:", error);
			}
		};

		fetchTodos();
	}, [setTodos]);

	const handleSubmit = async (e) => {
		e.preventDefault();
		await addTodo(newTodoTitle);
	};

	return (
		<div>
			<h1>Forum Posts</h1>
			<form onSubmit={handleSubmit}>
				<input
					type="text"
					value={newTodoTitle}
					onChange={(e) => setNewTodoTitle(e.target.value)}
					placeholder="Add a new to-do item"
				/>
				<button type="submit">Add</button>
			</form>
			<ul>
				{todos.map((todo) => (
					<li key={todo.id}>
						{todo.id} | {todo.title}
					</li>
				))}
			</ul>
		</div>
	);
};

export default Forum;
