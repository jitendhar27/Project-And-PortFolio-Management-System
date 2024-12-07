package com.klef.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.model.Feedback;
import com.klef.model.Project;
import com.klef.repository.FeedbackRepository;

@Service
public class FeedbackService {
    @Autowired
    private FeedbackRepository feedbackRepository;

    public Feedback addFeedback(Long projectId, String feedbackContent, Project project) {
        Feedback feedback = feedbackRepository.findByProjectId(projectId);
        if (feedback == null) {
            feedback = new Feedback();
            feedback.setProject(project);
        }
        feedback.setFeedback(feedbackContent);
        return feedbackRepository.save(feedback);
    }

    public Feedback getFeedbackByProjectId(Long projectId) {
        return feedbackRepository.findByProjectId(projectId);
    }
}

