<template>
  <div class="contrainer">
    <nav>
      <div class="whatsthisnavbarhavenaa">
        <a href="main.html">
          <div class="circle"></div>
        </a>
        <div class="menu">
          <a href="main.html" class="nav-color"> หน้าแรก</a>
          <span>&nbsp;&nbsp;&nbsp;&gt;</span>
          <a href="zone-1.html" class="nav-color"> &nbsp; เลือกรอบการแสดง</a>
          <span>&nbsp;&nbsp;&nbsp;&gt;</span>
          <a style="color: #eee; cursor: context-menu"> &nbsp; การสั่งซื้อ </a>
        </div>
        <div class="void"></div>
        <router-link to="/blog/myprofile">
          <div class="circle">A</div>
        </router-link>
        <!-- <a href="profile.html">
          <div class="circle">A</div>
        </a> -->
      </div>
    </nav>
    <div id="container">
      <div id="card">
        <div id="complete">
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="120px"
            height="120px"
            viewBox="0 0 512 512"
          >
            <path
              d="M470.6 105.4c12.5 12.5 12.5 32.8 0 45.3l-256 256c-12.5 12.5-32.8 12.5-45.3 0l-128-128c-12.5-12.5-12.5-32.8 0-45.3s32.8-12.5 45.3 0L192 338.7 425.4 105.4c12.5-12.5 32.8-12.5 45.3 0z"
            />
          </svg>
        </div>
        <div class="text1">การสั่งซื้อสำเร็จ</div>
        <div class="text2">รหัสสั่งซื้อ : {{ code_seat }}</div>
        <!-- <a href="main.html"><button class="text3">กลับหน้าหลัก</button></a> -->
      <router-link to="/"><button class="text3">กลับหน้าหลัก</button></router-link>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "HelloWorld",
  props: {
    msg: String,
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped src="">
/* @import "../assets/css/complete-buy.css";
@import "../assets/css/nav.css";
@import "../assets/css/navbar_buy.css"; */
</style>
