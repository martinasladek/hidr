#' Generate button that hides callouts based on ID
#'
#' @param colour_when_hidden String. Colour of the toggle switch when callouts are hidden. Default: "teal"
#' @param colour_when_showing String. Colour of the toggle switch when callouts are displayed. Default: "black"
#' @param text_when_hidden String. Text to display next to the switch when callouts are hidden. Default: "Show tips"
#' @param text_when_showing String. Text to display next to the switch when callouts are displayed Default: "Hide tips"
#' @param callout_id String. ID that identifies the callouts. Default: "hide". Needs to be set manually to all callouts that are meant to respond to the toggle switch.
#'
#' @return A character string of html, js and css code which generates the toggle switch. Save this string into an object, then call the object in an inline code of a Quarto document.
#' @export
#'
#' @examples
#'  \dontrun{
#'  ```{r}
#'  my_awesome_button <- generate_button()
#'  ```
#'
#'  Some text
#'
#'  `r my_awesome_button`
#' }
generate_button <- function(
    colour_when_hidden = "black",
    colour_when_showing = "teal",
    text_when_hidden = "Show tips",
    text_when_showing = "Hide tips",
    callout_id = "hide"
){
  paste0(
    '```{=HTML}', '\n',
    '

    <style>
        .switch-container {
           display: flex;
           align-items: center;
        }

        .switch {
            position: relative;
            display: inline-block;
            width: 60px;
            height: 34px;
            margin-right: 10px;
        }

        .switch input {
            display: none;

        }

        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: ', colour_when_showing, ';
            transition: .4s;
            border-radius: 34px;
        }

        .slider:before {
            position: absolute;
            content: "";
            height: 26px;
            width: 26px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            transition: .4s;
            border-radius: 50%;
        }

        input:checked + .slider {
            background-color: ',colour_when_hidden,';
        }

        input:checked + .slider:before {
            transform: translateX(26px);
        }
    </style>

    <script>

    function toggle() {
            var switchLabel = document.getElementById("switchLabel");
            var callouts = document.querySelectorAll("#',callout_id,'");
            var toggleSwitch = document.getElementById("toggleSwitch");

            if (toggleSwitch.checked) {
                switchLabel.innerHTML = "',text_when_hidden,'";

                // Hide all callout boxes
                callouts.forEach(function(callout) {
                    callout.style.display = "none";
                });
            } else {
                switchLabel.innerHTML = "',text_when_showing,'";

                // Show all callout boxes
                callouts.forEach(function(callout) {
                    callout.style.display = "block";
                });
            }
        }

    </script>


    <div class="switch-container">
      <label class="switch">
       <input type="checkbox" id="toggleSwitch" onclick="toggle()">
       <span class="slider"></span>
     </label>
    <span id="switchLabel">',text_when_showing,'</span>
    </div>
    <br>
    ', '\n',
    '```'
  )
}
