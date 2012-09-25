autowatch = 1;
outlets = 2;

var all_lines = new Array(0);
var alt_color = [0.996, 0.204, 0.804];
var main_color = [0., 0.447, 0.780];
var activeval = -1; //-1 means inactive
var offset = 0;
var ssize = 0.01;
var lsize = 0.03;
var width, halfwidth, height, aspect = new Number();
var lineloc, moveloc, textloc = new Array(2);
var fl;
var currfont;
var mouseflag = new Boolean();

mgraphics.init();
mgraphics.autofill = 0;
mgraphics.relative_coords = 1;

function output_ondrag(a){
   mouseflag = a; 
}

function loadbang(){
    calc_rect();
    fl = mgraphics.getfontlist();
    for(i=0; i<fl.length-1; i++){
	if(fl[i] == "Helvetica"){
	    currfont = fl[i];
	    break;
	}else if(fl[i] == "Arial"){
	    currfont = fl[i];
	    break;
	}
    }
}

function offset(a){
    offset = a;
    mgraphics.redraw();
}

function calc_rect(){
    width = box.rect[2] - box.rect[0];
    halfwidth = width / 2;
    height = box.rect[3] - box.rect[1];
    aspect = width / height;
}

function norm2signed(a){
    return (a * 2) - 1.0;
}

function paint(){
    if(all_lines.length){
	var loc = new Number();

	with(mgraphics){
	    for(i = 0; i < all_lines.length; i++){
		var currlineval = all_lines[i];
		loc = Math.floor(currlineval * width);
		temptext = (i + offset).toString();
		if(activeval > -1){ 
		    if(i == activeval){
			drawline(loc, alt_color, temptext, lsize);
		    }else{
			drawline(loc, main_color, temptext, ssize);
		    }
		}else{
		    drawline(loc, main_color, temptext, ssize);
		}
	    }
	}
    }
}

function drawline(xloc, colortype, text, size){
    moveloc = sketch.screentoworld(xloc, 0);
    lineloc = sketch.screentoworld(xloc, height);
    textloc = sketch.screentoworld(xloc + 4, 10);

    mgraphics.set_source_rgb(colortype);
    mgraphics.set_line_width(size);
    mgraphics.move_to(moveloc[0], moveloc[1]);
    mgraphics.line_to(lineloc[0], lineloc[1]);
    mgraphics.stroke();
    mgraphics.move_to(textloc[0], textloc[1]);
    mgraphics.select_font_face(currfont);
    mgraphics.set_font_size(9);
    mgraphics.text_path(text);
    mgraphics.fill();
}

function anything(){
    var a = arrayfromargs(arguments);
    activeval = -1;
    all_lines = a;
    calc_rect();
    mgraphics.redraw();
}

function getmarkers(){
    if(all_lines.length){
	var doublelen = all_lines.length * 2;
	var outarray = new Array(doublelen);
	var currval = 0;
	for(i=0; i<doublelen; i+=2){
	    outarray[i] = currval + offset;
	    outarray[i+1] = all_lines[currval]
	    currval++;
	}
	outlet(0, "markers", outarray);
    }else{
	outlet(0, "markers", "bang");
    }
}

function getmarker(a){
    var currval = all_lines[a - offset];
    outlet(0, "marker", a, currval);
}

function move(a){
    activeval = a;
    outlet(0, "current", activeval + 1, all_lines[activeval]);
    mgraphics.redraw();
}

function onclick(x, y, button){
    handleclick(x);
}

function ondrag(x, y, button){
    handleclick(x);
    if(button == 0 && mouseflag){ 
	getmarkers();
    }
}

function handleclick(x){
    if(all_lines.length && activeval > -1){
	calc_rect();
	thisx = x / width;
	all_lines[activeval] = thisx;
	mgraphics.redraw();
	outlet(0, "current", activeval + offset, all_lines[activeval])
    }
}

function onresize(){
    calc_rect();
    mgraphics.redraw();
}

function clear(){
    activeval = -1;
    all_lines = new Array();
    mgraphics.redraw();
}
