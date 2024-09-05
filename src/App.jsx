import { useState } from 'react';
import { getAnswer } from './wxFlows';
import './App.css';

function App() {
  const [inputText, setInputText] = useState('');
  const [displayText, setDisplayText] = useState('');
  const [isLoading, setIsLoading] = useState(false);

  const handleInputChange = (e) => {
    setInputText(e.target.value);
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    setIsLoading(true);
    setDisplayText('Loading...');
    getAnswer(inputText).then((answer) => {
      setDisplayText(answer);
      setIsLoading(false);
    }).catch((error) => {
      setIsLoading(false);
      setDisplayText(error.message);
    });
  };

  return (
    <div className="App">
      <div className='title'>AskStock - Powered by IBM watsonx</div>
      <form onSubmit={handleSubmit}>
        <input
          type="text"
          value={inputText}
          onChange={handleInputChange}
          placeholder="Enter text"
        />
        <button type="submit" disabled={isLoading}>
          {isLoading ? 'Loading...' : 'Submit'}
        </button>
      </form>
      <div>{displayText}</div>
    </div>
  );
}

export default App;
