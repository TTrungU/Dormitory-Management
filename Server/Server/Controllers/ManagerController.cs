﻿using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Server.Interface;
using Server.Models;


namespace Server.Controllers
{

    [Route("api/[controller]")]
    [ApiController]
    public class ManagerController :ControllerBase
    {
        private readonly IManager _managerRepository;
        //private readonly I _managerRepository;
        private IMapper _mapper;

        public ManagerController(IManager managerRepository, IMapper mapper)
        {
            _managerRepository = managerRepository;
            _mapper = mapper;
        }

        [HttpGet]
        [ProducesResponseType(200, Type = typeof(IEnumerable<Manager>))]
        public IActionResult GetAllManager() { 
            var manager = _managerRepository.GetAllManager();
            return Ok(manager);
        }

        [HttpGet("{managerId}")]
        [ProducesResponseType(200, Type = typeof(Manager))]
        [ProducesResponseType(400)]
        public IActionResult GetByManagerId(int id)
        {
            var manager = _managerRepository.GetManagerById(id);
            return Ok(manager);
        }

        [HttpGet("{blockId}/block")]
        [ProducesResponseType(200, Type = typeof(IEnumerable<Manager>))]
        [ProducesResponseType(400)]
        public IActionResult GetByBlockId(int id)
        {
            var manager = _managerRepository.GetManagerByIdBock(id);
            return Ok(manager);
        }

        [HttpPut("{id}")]
        public IActionResult Update(int id, UpdateManager model)
        {
            _managerRepository.UpdateManager(id, model);
            return Ok(new { message = "User updated" });
        }
        [HttpPost]
        public IActionResult CreateManager(CreateManager model)
        {
            _managerRepository.CreateManager(model);
            return Ok(new { message = "Manager created" });
        }

    }
}