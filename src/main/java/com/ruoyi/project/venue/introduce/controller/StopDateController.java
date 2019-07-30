package com.ruoyi.project.venue.introduce.controller;

import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.venue.introduce.domain.StopDate;
import com.ruoyi.project.venue.introduce.service.IStopDateService;



/**
 * 禁用日期 信息操作处理
 * 
 * @author jungao
 * @date Dec 14, 2018 2:04:04 PM
 */
@Controller
@RequestMapping("/venue/stopdate")
public class StopDateController extends BaseController {
	private String prefix = "venue/stopdate";

	@Autowired
	private IStopDateService stopDateService;

	@RequiresPermissions("venue:stopdate:view")
	@GetMapping()
	public String stopdate() {
		return prefix + "/index";
	}

	/**
	 * 查询禁用日期列表
	 */
	@RequiresPermissions("venue:stopdate:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(StopDate stopdate) {
		startPage();
		List<StopDate> list = stopDateService.selectStopDateList(stopdate);
		return getDataTable(list);
	}
	
	/**
	 * 新增禁用日期
	 */
	@GetMapping("/add")
	public String add() {
//		mmap.put("venues", introduceService.selectAllVenues());
		return prefix + "/add";
	}
	
	/**
	 * 新增保存禁用日期
	 */
	@RequiresPermissions("venue:stopdate:add")
	@Log(title = "新增禁用日期", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(StopDate stopdate) {
		return toAjax(stopDateService.insertStopDate(stopdate));
	}



	/**
	 * 删除禁用日期
	 */
	@RequiresPermissions("venue:stopdate:remove")
	@Log(title = "删除禁用日期", businessType = BusinessType.DELETE)
	@PostMapping("/remove")
	@ResponseBody
	public AjaxResult remove(String ids) {
		return toAjax(stopDateService.deleteStopDateByIds(ids));
	}
}
