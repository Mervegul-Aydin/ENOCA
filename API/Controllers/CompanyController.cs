using Business.Abstract;
using Entities.Dto;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CompanyController : ControllerBase
    {
        ICompanyService _companyService;

        public CompanyController(ICompanyService companyService)
        {
            _companyService = companyService;
        }

        [HttpGet("getall")]
        public IActionResult GetAll()
        {
            var result = _companyService.GetAll();
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result);
        }

        [HttpPost("add")]
        public IActionResult Add(CompanyDto companyDto)
        {
            var result = _companyService.Add(companyDto);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result);
        }


        [HttpPut("update")]
        public IActionResult Update(int id, bool isActive, string? orderStartTime, string? orderFinishTime)
        {
            var result = _companyService.Update(id, isActive, orderStartTime, orderFinishTime);
            if (result.Success)
            {
                return Ok(result);
            }
            return BadRequest(result);
        }


    }

}
