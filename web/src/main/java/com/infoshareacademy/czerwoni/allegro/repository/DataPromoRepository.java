package com.infoshareacademy.czerwoni.allegro.repository;

import com.infoshareacademy.czerwoni.allegro.AllegroCategory;
import com.infoshareacademy.czerwoni.allegro.service.CategoriesService;
import com.infoshareacademy.czerwoni.allegro.domain.DataPromo;
import com.infoshareacademy.czerwoni.parse.ParseXmlAllegroCategories;

import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.*;
import java.util.stream.Collectors;

@Stateless
public class DataPromoRepository {

    List<AllegroCategory> categories = ParseXmlAllegroCategories.deserialization();

    @Inject
    CategoriesService categoriesService;

    @PersistenceContext(unitName = "pUnit")
    EntityManager entityManager;

    public boolean addCategory(int id) {
        if (checkIfCategoryExists(id)) {
            DataPromo dataPromo = new DataPromo();
            dataPromo.setPromotedCategory(categoriesService.getCategoryById(id).getCatId());
            if (!checkIfCategoryPromoted(id)) {
                entityManager.persist(dataPromo);
            }
            return true;
        }
        return false;
    }

    public boolean removeCategory(int id) {
        if (checkIfCategoryPromoted(id)){
            List<DataPromo> dataPromos = getDataPromoById();
            DataPromo dataPromo = dataPromos.stream().filter(promo -> promo.getPromotedCategory() == id).findFirst().get();
            entityManager.remove(entityManager.contains(dataPromo) ? dataPromo : entityManager.merge(dataPromo));
            return true;
        }
        return false;
    }

    public AllegroCategory getPromotedCategoryById(Integer id) {
        return categories.stream()
                .filter(category -> category.getCatId() == entityManager.find(DataPromo.class, id).getPromotedCategory())
                .findFirst()
                .orElse(null);
    }

    public List<AllegroCategory> setPromotedCategories() {
        List promoCatOb = entityManager.createNamedQuery("getAllPromotedCategories").getResultList();
        for (AllegroCategory category: categories) {
            category.setPromoted(false);
        }
        for (AllegroCategory category: categories) {
            for (Object id: promoCatOb) {
                if (category.getCatId().equals(id)) {
                    category.setPromoted(true);
                }
            }
        }
        return categories;
    }

    public List<AllegroCategory> getAllCategories() {
        List promoCatOb = entityManager.createNamedQuery("getAllPromotedCategories").getResultList();
        List<AllegroCategory> promoCat = new ArrayList<>();
        for (Object id: promoCatOb) {
            promoCat.add(categoriesService.getCategoryById((Integer) id));
        }
        return promoCat;
    }

    public Map<AllegroCategory, String> getSearchedCategories(String keyWord) {
        if (!keyWord.isEmpty()) {
            return categories.stream()
                    .filter(allegroCategory -> allegroCategory
                            .getCatName()
                            .toLowerCase()
                            .contains(keyWord.toLowerCase()))
                    .collect(Collectors
                            .toMap(category -> category, category -> getBreadCrumbsString(category.getCatId())));
        }
        return Collections.EMPTY_MAP;
    }

    public Map<AllegroCategory, String> getPromotedCategories() {
        List<AllegroCategory> categoriesList = getAllCategories();
        if (!categoriesList.isEmpty()) {
            return categoriesList.stream()
                    .collect(Collectors
                    .toMap(category -> category, category -> getBreadCrumbsString(category.getCatId())));
        }
        return Collections.EMPTY_MAP;
    }

    private boolean checkIfCategoryExists(int id) {
        return categoriesService.checkIfCategoryExists(id);
    }

    private boolean checkIfCategoryPromoted(int id) {
        List<AllegroCategory> categories = getAllCategories();
        return categories.stream()
                .anyMatch(allegroCategory -> allegroCategory.getCatId() == id);
    }

    public String getBreadCrumbsString(int id) {
        List<AllegroCategory> breadCrumbs = categoriesService.getBreadCrumbs(id);
        StringBuilder breadCrumbString = new StringBuilder();

        for (AllegroCategory category: breadCrumbs) {
            breadCrumbString
                    .append(category.getCatName())
                    .append(" > ");
        }
        return breadCrumbString.deleteCharAt(breadCrumbString.length()-2).toString();
    }

    private List<DataPromo> getDataPromoById() {
        String query = "FROM DataPromo";
        return entityManager.createQuery(query).getResultList();
    }
}
