<#include "header.ftl">

	<#include "menu.ftl">
	<div class="contentBox">

		<h2>Blog</h2>

	<#list posts as post>
  		<#if (post.status == "published")>
  			<a href="${post.uri}"><h3><#escape x as x?xml>${post.title}</#escape></h3></a>
  			<p>${post.date?string("dd MMMM yyyy")}</p>
  			<p>${post.body}</p>
				<hr/>
  		</#if>
  	</#list>



	<p>Older posts are available in the <a href="${content.rootpath}${config.archive_file}">archive</a>.</p>
	</div>
<#include "footer.ftl">
