using Business.Abstract;
using Entities.Dto;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{

    [Route("api/[controller]")]
    [ApiController]
    public class ProductController : ControllerBase
    {
        IProductService _productService;

        public ProductController(IProductService productService)
        {
            _productService = productService;
        }


        [HttpPost("add")]
        public IActionResult Add(ProductDto productDto)
        {
            var result = _productService.Add(productDto);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result);
        }

    }

}