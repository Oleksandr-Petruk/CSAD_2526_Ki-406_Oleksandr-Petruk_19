#include <gtest/gtest.h>
#include "math_operations.h"

TEST(MathOperationsTest, BasicAddition) {
    EXPECT_EQ(add(2, 2), 4);
    EXPECT_EQ(add(10, 5), 15);
}