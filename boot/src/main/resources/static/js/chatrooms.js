$(document).ready(function(){

    $(".btn-secondary").on("click", function (e){
        e.preventDefault();
        var name = $("input[name='name']").val();
        console.log(name);

        if(name == "")
        {
            alert("Please 방이름을 작성해주세요");
        }
        else
        {
            $("form").submit();
        }
          
    });

});