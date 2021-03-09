
# coding: utf-8

# In[1]:


import pandas as pd


# In[32]:


class ndist:    
    # d(p,q) = sqrt(((p1-q1)**2) + ((p2-q2)**2) + ... + ((pn-qn)**2))
    def standardize_col(col, mean, sd):
        return((col - mean) / sd)
    
    def dataframe(p,q):
        data = {'p':p,'q':q}
        data_frame = pd.DataFrame(data)
        
        mean = data_frame['p'].mean()
        sd = data_frame['p'].std()
        data_frame['p'] = data_frame['p'].apply(ndist.standardize_col,
                                                args=[mean, sd])
        
        mean = data_frame['q'].mean()
        sd = data_frame['q'].std()
        data_frame['q'] = data_frame['q'].apply(ndist.standardize_col,
                                                args=[mean, sd])
        
        data_frame['sq_distances'] = (data_frame['p'] - 
                                      data_frame['q'])**2
        data_frame.columns = ['p_normed','q_normed', 'sq_distances']
        return(data_frame)
    
    def distance(p,q):
        from math import sqrt
        distance = sqrt(ndist.dataframe(p,q)['sq_distances'].sum())
        return(distance)
    
    def dimensions(p,q):
        dimensions = len(ndist.dataframe(p,q))
        return(dimensions)    


# In[43]:


ndist.dataframe([5,4,9],[18,11,12])


# In[44]:


ndist.distance([5,2,9],[5,8,1])


# In[45]:


ndist.dimensions([5,2,9],[5,8,1])

