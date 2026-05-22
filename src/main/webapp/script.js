

// Protecting the tasks.html from opening without log in
let currentPage=window.location.pathname;

if(currentPage.includes("tasks.html")){
    let loginStatus = JSON.parse(localStorage.getItem("isLoggedIn"));

    if (!loginStatus){
        alert("Please Log In First!");
        window.location.href = "login.html";
    }
}


//Logout button login
let LogoutButton = document.getElementById("logoutBtn");

if(LogoutButton){
    LogoutButton.addEventListener("click",function(){
        localStorage.removeItem("isLoggedIn");
        alert("Logged Out Successfully!");
        window.location.href = "index.html";
    });
}

//Dynamic NavBar Logic

let signuplink = document.getElementById("signupLink");
let loginlink = document.getElementById("loginLink");
let logoutBtn = document.getElementById("logoutBtn");

let loginStatus = localStorage.getItem("isLoggedIn");

if(loginStatus == "true"){
    if(signuplink){
        signuplink.style.display = "none";
    }

    if(loginlink){
        loginlink.style.display = "none";
    }
}else{
    if(logoutBtn){
        logoutBtn.style.display="none";
    }
}

//Dynamically adding Tasks in tasks.html
let addButton = document.getElementById("addTaskBtn");

if(addButton){
    addButton.addEventListener("click", function(){

        let task = document.getElementById("taskInput").value;

        if(task == ""){
            alert("Please enter the task first!");
            return;
        }

        // find "tasks" key in local storage if not found create empty array
        let tasks = JSON.parse(localStorage.getItem("tasks")) || [];

        // Add new task
        tasks.push(task);

        // Save updated tasks array
        localStorage.setItem("tasks", JSON.stringify(tasks));

        alert("Task Added Successfully!");

        // Clear input field
        document.getElementById("taskInput").value = "";
    });
}

showTasks();
function showTasks(){

    let taskList = document.getElementById("taskList");

    if(!taskList){
        return;
    }

    taskList.innerHTML = "";

    let taskArray = JSON.parse(localStorage.getItem("tasks")) || [];

    for(let i = 0; i < taskArray.length; i++){

        taskList.innerHTML += `
        <tr>
            <td>${taskArray[i]}</td>
            <td>
                <button onclick="deleteTask(${i})">
                    Delete
                </button>
            </td>
        </tr>
        `;
    }
}
function deleteTask(index){

    let taskArray = JSON.parse(localStorage.getItem("tasks")) || [];

    taskArray.splice(index, 1);

    localStorage.setItem("tasks", JSON.stringify(taskArray));

    showTasks();
}






let addCattleBtn = document.getElementById("addCattleBtn");

if(addCattleBtn){

    addCattleBtn.addEventListener("click", function(){

        let cattleName = document.getElementById("cattleName").value;

        let breed = document.getElementById("breed").value;

        if(cattleName == ""){
            alert("Please enter cattle name!");
            return;
        }

        let cattleArray =
        JSON.parse(localStorage.getItem("cattle")) || [];

        cattleArray.push({
            name: cattleName,
            breed: breed
        });

        localStorage.setItem("cattle",
        JSON.stringify(cattleArray));

        alert("Cattle Added Successfully!");

        document.getElementById("cattleName").value = "";

        showCattle();
    });
}

showCattle();

function showCattle(){

    let cattleList = document.getElementById("cattleList");

    cattleList.innerHTML = "";

    let cattleArray =
    JSON.parse(localStorage.getItem("cattle")) || [];

    for(let i = 0; i < cattleArray.length; i++){

        cattleList.innerHTML += `
        <tr>
            <td>${cattleArray[i].name}</td>

            <td>${cattleArray[i].breed}</td>

            <td>
                <button onclick="deleteCattle(${i})">
                    Delete
                </button>
            </td>
        </tr>
        `;
    }
}

function deleteCattle(index){

    let cattleArray =
    JSON.parse(localStorage.getItem("cattle")) || [];

    cattleArray.splice(index, 1);

    localStorage.setItem("cattle",
    JSON.stringify(cattleArray));

    showCattle();
}