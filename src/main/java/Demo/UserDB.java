package Demo;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class UserDB {
    private static final List<User> USERS = new ArrayList<>();

    public static void insert(User user) {          // giả lập lưu DB
        if (user != null) USERS.add(user);
    }

    public static List<User> getAll() {
        return Collections.unmodifiableList(USERS);
    }
}
