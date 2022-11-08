package com.instagram.timeline;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/timeline")
@Controller
public class TimelineController {
	
	/*
	 * 타임라인 화면
	 */
	@RequestMapping("/timeline_view")
	public String timelineView() {
	
		return "timeline/timeline";
	}
}
