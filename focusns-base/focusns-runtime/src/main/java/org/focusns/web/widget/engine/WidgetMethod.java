/*
 * Copyright (C) 2012 FocuSNS.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
 * MA 02110-1301  USA
 */
package org.focusns.web.widget.engine;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.focusns.web.widget.annotation.Resource;
import org.focusns.web.widget.annotation.Resources;
import org.springframework.core.annotation.AnnotationUtils;

public class WidgetMethod {
    
    private Method method;

    public WidgetMethod(Method method) {
        this.method = method;
    }

    public Method getMethod() {
        return method;
    }

    public List<Resource> getMethodResources() {
        List<Resource> resourceList = new ArrayList<Resource>();
        Resource resource = AnnotationUtils.getAnnotation(method, Resource.class);
        if(resource!=null) {
            resourceList.add(resource);
        }
        //
        Resources resources = AnnotationUtils.getAnnotation(method, Resources.class);
        if(resources!=null) {
            resourceList.addAll(Arrays.asList(resources.value()));
        }
        //
        return resourceList;
    }
    
}
