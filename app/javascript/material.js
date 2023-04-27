
export function autoinitMaterial() { // M.AutoInit() is breaking toasts, sice it auto inits all twice
  initDropdowns()
  initNavbars()
  M.updateTextFields();
}
export function initDropdowns() {
  var elems = document.querySelectorAll('.dropdown-trigger');
  M.Dropdown.init(elems);
}
export function initNavbars() {
  var elems = document.querySelectorAll('.sidenav');
  M.Sidenav.init(elems);
}
