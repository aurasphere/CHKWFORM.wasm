import wasmModule from "./build/CHKWFORM.js";
globalThis.response = {
  body: "",
};
globalThis.request = {
  params: {
    lowerBound: 10,
    higherBound: 20,
  },
};

const instance = wasmModule();
window.validateForm = (event) => {
  event.preventDefault();

  globalThis.request.params.input =
    document.getElementById("demo-number").value;
  
    instance._entry();
    
  const validationOutcomeElement = document.getElementById(
    "demo-validation-outcome"
  );
  validationOutcomeElement.textContent = globalThis.response.body;
  if (globalThis.response.body === "CC0000") {
    validationOutcomeElement.style.color = "green";
  } else {
    validationOutcomeElement.style.color = "red";
  }

  return false;
};
