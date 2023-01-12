<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="pwrapper">
      <img
        src="https://i.ibb.co/rvJd2XR/rate.png"
        alt="Exchange Rate Calculator"
        class="pmoney-img"
      />
      <h1>꿀머니 환급소</h1>
      <p>보유하신 꿀머니를 환급해드립니다.</p>
      <div class="pcontainer">
        <div class="pcurrency">
          <select id="pcurrency-one">
            <option value="ggul">꿀</option>
          </select>
          <input type="text" id="pamount-one" placeholder="0" value="1" />
        </div>


        <div class="pcurrency">
          <select id="pcurrency-two">
            <option value="won">원</option>
          </select>
          <input type="text" id="pamount-two" placeholder="0" />
        </div>
        
        <div class="pswap-rate-container">
          
          환급계좌: <input type="text" id="" name="">
          <button class="pbtn" id="swap">환급</button>
          <div class="prate" id="rate"></div>
        </div>
        
      </div>
    </div>

<style>
@import url("https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap");

:root {
  --primary-color: #fd5900;
}

* {
  box-sizing: border-box;
}

body {
  background-color: #070606;
  font-family: "Roboto", sans-serif;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  height: 100vh;
  margin: 0;
  padding: 20px;
}

.pwrapper {
  background-color: #f4efea;
  padding: 2rem;
  border-radius: 10px;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}

h1 {
  color: var(--primary-color);
}

p {
  text-align: center;
}

.pbtn {
  color: #fff;
  background-color: var(--primary-color);
  cursor: pointer;
  border-radius: 5px;
  font-size: 12px;
  padding: 5px 12px;
  border: none;
  margin-left: 130px;
}

.pmoney-img {
  width: 150px;
  margin: auto 0;
}

.pcurrency {
  padding: 30px 0;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.pcurrency select {
  padding: 10px 20px 10px 10px;
  -moz-appearance: none;
  -webkit-appearance: none;
  appearance: none;
  border: 1px solid #dedede;
  font-size: 16px;
  background: transparent;
  background-image: url("data:image/svg+xml;charset=US-ASCII,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%22292.4%22%20height%3D%22292.4%22%3E%3Cpath%20fill%3D%22%20000002%22%20d%3D%22M287%2069.4a17.6%2017.6%200%200%200-13-5.4H18.4c-5%200-9.3%201.8-12.9%205.4A17.6%2017.6%200%200%200%200%2082.2c0%205%201.8%209.3%205.4%2012.9l128%20127.9c3.6%203.6%207.8%205.4%2012.8%205.4s9.2-1.8%2012.8-5.4L287%2095c3.5-3.5%205.4-7.8%205.4-12.8%200-5-1.9-9.2-5.5-12.8z%22%2F%3E%3C%2Fsvg%3E");
  background-position: right 10px top 50%, 0, 0;
  background-size: 12px auto, 100%;
  background-repeat: no-repeat;
}

.pcurrency input {
  border: 0;
  background: transparent;
  font-size: 30px;
  text-align: right;
}

.pswap-rate-container {
  display: flex;
  align-items: stretch;
}

.prate {
  color: var(--primary-color);
  font-size: 14px;
}

select:focus,
input:focus,
button:focus {
  outline: 0;
}

@media (max-width: 600px) {
  .pcurrency input {
    width: 200px;
  }
  .pmoney-img {
  width: 75px;
}
}

</style>
