<#include "header.ftl">

	<#include "menu.ftl">

	<div class="contentBox">
		<h2><#escape x as x?xml>${content.title}</#escape></h2>


	<p><em><#if (content.date)??>${content.date?string("dd MMMM yyyy")}<#else></#if></em></p>


	<p>${content.body}</p>



	</div>

<#include "footer.ftl">
