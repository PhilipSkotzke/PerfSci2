<ul id="choose-your-tool" class="nav nav-tabs mb-4" role="tablist">
  <li class="nav-item" role="presentation">
    <a class="nav-link" href="index.html">
      <img src="/images/flag_de.svg" width="24"> Deutsch
    </a>
  </li>
  <li class="nav-item" role="presentation">
    <a class="nav-link" href="en.html">
      <img src="/images/flag_en.svg" width="24"> English
    </a>
  </li>
</ul>

<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function() {
  // get file name
  const filename = window.location.pathname.split("/").slice(-1)[0];
  
  // latch active
  const toolLinks = window.document.querySelectorAll("#choose-your-tool a");
  for (const tool of toolLinks) {
    if (tool.href.endsWith(filename)) {
      tool.classList.add("active");
      break;
    }
  }
  
   // save in local storage
  window.localStorage.setItem("tutorialToolGetStarted", filename);
});

</script>