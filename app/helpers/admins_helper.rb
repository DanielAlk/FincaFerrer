module AdminsHelper
	def tinymce_init
		'<script>
			//<![CDATA[
			tinyMCE.init({
				selector: "textarea.tinymce",
				toolbar: "bold italic | undo redo | link",
				menubar: false,
				statusbar: false,
				forced_root_block: false,
				plugins: "link"
			});
			//]]>
		</script>'.html_safe
	end
end
