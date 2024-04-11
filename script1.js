function goToIndex() {
  window.location.href = "index.html";
}

const form = document.getElementById('dataForm');
form.addEventListener('submit', async (event) => {
  event.preventDefault();

  const formData = new FormData(form);
  const scores = {
    A1: parseInt(formData.get('A1')),
    A2: parseInt(formData.get('A2')),
    A3: parseInt(formData.get('A3')),
    A4: parseInt(formData.get('A4')),
    A5: parseInt(formData.get('A5')),
    A6: parseInt(formData.get('A6')),
    A7: parseInt(formData.get('A7')),
    A8: parseInt(formData.get('A8')),
    A9: parseInt(formData.get('A9')),
    A10: parseInt(formData.get('A10')),
  };
  console.log(scores);

  const gender = formData.get('gender');
  const selectedModel = formData.get('model');

  let url = '';
  if (selectedModel === 'knn') {
    url = 'http://localhost:5000/knn-predict'; // Replace with your actual backend URL
  } else if (selectedModel === 'rf') {
    url = 'http://localhost:5000/rf-predict'; // Replace with your actual backend URL
  } else if (selectedModel === 'dt') {
    url = 'http://localhost:5000/dt-predict'; // Replace with actual URL for Decision Tree endpoint
  } else if (selectedModel === 'logistic') {
    url = 'http://localhost:5000/logistic-predict'; // Replace with actual URL for Logistic Regression endpoint
  } else {
    console.error("Invalid model selection");
    return;
  }

  try {
    const response = await fetch(url, {
      method: 'POST',
      body: JSON.stringify({ scores, gender }), // Assuming data is sent as JSON
      headers: { 'Content-Type': 'application/json' }
    });

    if (!response.ok) {
      throw new Error('Network response was not ok');
    }

    const data = await response.json()
    const resultsDiv = document.getElementById('results');
    resultsDiv.textContent = data.prediction; // Update results with prediction from backend
  } catch (error) {
    console.error('Error:', error);
    const resultsDiv = document.getElementById('results');
    resultsDiv.textContent = 'An error occurred. Please try again.';
  }
});