package com.orangeBlog.service;

import com.orangeBlog.entity.Category;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 类目表，一个文章仅可拥有一个类目 服务类
 * </p>
 *
 * @author cdd
 * @since 2023年11月09日
 */
@Service
public interface ICategoryService extends IService<Category> {
    List<Category> getAllCategoryNames();
    Category getNameById(Long id);

    String getCateName(Long id);

    Integer getCOUNT(Long id);
}
