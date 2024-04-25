// src/Forum.js

import React, { useState, useEffect } from 'react';
import axios from 'axios';

const Forum = () => {
  const [posts, setPosts] = useState([
  { id: 1, title: 'Do backend' },
  { id: 2, title: 'Do fronend' },
  { id: 3, title: 'Do databse' },]);
  const [newTodo, setNewTodo] = useState('');

  useEffect(() => {
    const fetchPosts = async () => {
      try {
        const response = await axios.get('https://your-api-endpoint.com/posts');
        setPosts(response.data);
      } catch (error) {
        console.error('Error fetching posts:', error);
      }
    };

    fetchPosts();
  }, []);

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const response = await axios.post('https://your-api-endpoint.com/posts', {
        title: newTodo,
        // Additional fields if needed
      });
      setPosts([...posts, response.data]); // Add the new post to the state
      setNewTodo(''); // Clear the input field
    } catch (error) {
      console.error('Error creating post:', error);
    }
  };

  return (
    <div>
      <h1>Forum Posts</h1>
      <form onSubmit={handleSubmit}>
        <input
          type="text"
          value={newTodo}
          onChange={(e) => setNewTodo(e.target.value)}
          placeholder="Add a new to-do item"
        />
        <button type="submit">Add</button>
      </form>
      <ul>
        {posts.map(post => (
          <li key={post.id}>{post.title}</li>
        ))}
      </ul>
    </div>
  );
};

export default Forum;
